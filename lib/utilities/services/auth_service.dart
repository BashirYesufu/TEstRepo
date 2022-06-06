import 'dart:convert';
import 'package:apex/models/user.dart';
import 'package:apex/utilities/shared_pref.dart';
import 'package:http/http.dart' as http;
import '../../constants/string_literals.dart';

class AuthService {
  Future<User> createUser({
    required String email,
    required String fullName,
    required String password,
    String? username,
    required String country,
  }) async {
    dynamic body = {
      'full_name': fullName,
      'username': username,
      'email': email,
      'country': country,
      'password': password,
      'device_name': 'web'
    };
    try {
      var url = Uri.parse(ApiEndPoints.signUp);
      var response = await http.post(
        url,
        body: body,
      );
      var jsonResponse = jsonDecode(response.body.toString()) as Map<String, dynamic>;
      var result = jsonResponse['data']['user'];
      Shared.setString(Shared.userToken, jsonResponse['data']['token']);
      Shared.setString(Shared.userEmail, result['email']);
      return User(
        id: result['id'],
        fullName: result['full_name'],
        email: result['email'],
        userName: result['username'],
        phone: result['phone'],
        phoneCountry: result['phone_country'],
        country: result['country'],
        avatar: result['avatar'],
        token: jsonResponse['data']['token'],
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<User> loginUser({
    required String email,
    required String password,
  }) async {
    dynamic body = {
      'email': email,
      'password': password,
      'device_name': 'web',
    };
    try {
      var url = Uri.parse(ApiEndPoints.signIn);
      var response = await http.post(url, body: body);
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      var result = jsonResponse['data']['user'];
      Shared.setString(Shared.userToken, jsonResponse['data']['token']);
      Shared.setString(Shared.userEmail, result['email']);
      return User(
        id: result['id'],
        fullName: result['full_name'],
        email: result['email'],
        userName: result['username'],
        phone: result['phone'],
        phoneCountry: result['phone_country'],
        country: result['country'],
        avatar: result['avatar'],
        token: jsonResponse['data']['token'],
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getEmailToken({required String email}) async {
    dynamic body = {
      'email': email,
    };
    try {
      var url = Uri.parse(ApiEndPoints.getToken);
      var response = await http.post(url, body: body);
      var jsonResponse = jsonDecode(response.body.toString()) as Map<String, dynamic>;
      String token = jsonResponse['data']['token'];
      return token;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> verifyEmailToken({required String email, required String token}) async {
    dynamic body = {
      'email': email,
      'token': token,
    };
    try {
      var url = Uri.parse(ApiEndPoints.verifyToken);
      var response = await http.post(url, body: body);
      var jsonResponse = jsonDecode(response.body.toString()) as Map<String, dynamic>;
      String email = jsonResponse['data']['email'];
      return email;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> logOutUser({required String email}) async {
    dynamic body = {
      'email': email,
    };
    try {
      var url = Uri.parse(ApiEndPoints.signOut);
      var response = await http.post(url, body: body);
      var jsonResponse = jsonDecode(response.body.toString()) as Map<String, dynamic>;
      bool success = jsonResponse['status'];
      return success;
    } catch (e) {
      rethrow;
    }
  }
}
