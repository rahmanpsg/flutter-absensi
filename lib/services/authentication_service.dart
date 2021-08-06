import 'dart:convert';

import 'package:absensi/app/api.dart';
import 'package:absensi/models/responseApi_models.dart';
import 'package:http/http.dart' show Client;
import 'package:absensi/models/user_models.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationService {
  Client client = Client();

  Future<UserModel?> getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user = prefs.getString('user');

    // print(user);

    if (user != null) {
      final json = jsonDecode(user);
      return UserModel.fromJson(json);
    }

    return null;
  }

  Future<bool> isLogged() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user = prefs.getString('user');

    return user != null;
  }

  Future signIn(
    String username,
    String password,
  ) async {
    try {
      await Future.delayed(Duration(milliseconds: 1500));

      final url = '$BASE_URL/login/karyawan';
      final response = await client.post(Uri.parse(url),
          headers: headers,
          body: jsonEncode(UserModel(
            username: username,
            password: password,
          )));

      final res = jsonDecode(response.body);

      if (response.statusCode != 200) {
        return ResponseApiModel.fromJson(res);
      }

      UserModel user = UserModel.fromJson(res['user']);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('user', jsonEncode(user));

      return user;
    } catch (e) {
      return ResponseApiModel(
        error: true,
        message: 'Terjadi masalah yang tidak diketahui',
      );
    }
  }

  Future<void> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
  }

  static Future<bool> authenticateWithBiometrics() async {
    final LocalAuthentication localAuthentication = LocalAuthentication();
    bool isBiometricSupported = await localAuthentication.isDeviceSupported();
    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

    bool isAuthenticated = false;

    if (isBiometricSupported && canCheckBiometrics) {
      isAuthenticated = await localAuthentication.authenticate(
        androidAuthStrings: AndroidAuthMessages(
          signInTitle: 'Absensi',
          biometricHint: '',
          biometricRequiredTitle: 'Otentikasi diperlukan',
          cancelButton: 'batal',
        ),
        localizedReason: 'Harap lengkapi biometrik untuk melanjutkan.',
        biometricOnly: true,
      );
    }

    return isAuthenticated;
  }

  Future setHeaderToken(Map<String, String> header) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user = prefs.getString('user');

    if (user != null) {
      UserModel userModel = UserModel.fromJson(jsonDecode(user));
      final newHeader = header;
      newHeader['x-access-token'] = userModel.token ?? '';
      return newHeader;
    }

    return header;
  }
}
