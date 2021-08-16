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
    String? token = prefs.getString('token');

    // print(user);

    if (token != null) {
      final url = '$BASE_URL/login/cek/$token';
      final response = await client.get(Uri.parse(url));

      final res = jsonDecode(response.body);

      return UserModel.fromJson(res);
    }

    return null;
  }

  Future<String?> getUserID() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userID = prefs.getString("userID");

      return userID;
    } catch (e) {
      return null;
    }
  }

  Future<bool> isLogged() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    return token != null;
  }

  Future signIn(
    String username,
    String password,
  ) async {
    try {
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
      prefs.setString('token', user.token.toString());
      prefs.setString('userID', user.id.toString());

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
    prefs.remove('token');
    prefs.remove('userID');
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
    String? token = prefs.getString('token');

    if (token != null) {
      final newHeader = header;
      newHeader['x-access-token'] = token;
      return newHeader;
    }

    return header;
  }
}
