import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:absensi/models/user_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationService {
  final _baseUrl = "http://192.168.43.239:5000";
  // final _baseUrl = "http://sensus-malimpung.000webhostapp.com/api";
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
      // await Future.delayed(Duration(milliseconds: 1500));

      final url = '$_baseUrl/login';
      final response = await client.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(UserModel(
            username: username,
            password: password,
          )));

      final res = jsonDecode(response.body);

      if (response.statusCode != 200) {
        throw res['message'];
      }

      UserModel user = UserModel.fromJson(res['user']);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('user', jsonEncode(user));

      return user;
    } catch (e) {
      return e;
    }
  }

  Future<void> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
  }
}
