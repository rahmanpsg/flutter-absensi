import 'dart:convert';

import 'package:absensi/app/api.dart';
import 'package:http/http.dart' show Client;
import 'package:absensi/models/user_models.dart';
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
      // await Future.delayed(Duration(milliseconds: 1500));

      final url = '$BASE_URL/login';
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
