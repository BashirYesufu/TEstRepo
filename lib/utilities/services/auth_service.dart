import 'dart:convert';
import 'package:apex/models/user.dart';
import 'package:http/http.dart' as http;
import '../../constants/string_literals.dart';

class AuthService {
  Future<User> createUser({
    required String email,
    required String fullName,
    required String password,
    String? username,
    String? country,
  }) async {
    dynamic body = {
      'full_name': fullName,
      //'username': username,
      'email': email,
      'password': password,
      'country': country,
      'device_name': 'web'
    };
    try {
      var url = Uri.parse(ApiEndPoints.signUp);
      var response = await http.post(
        url,
        body: body,
      );
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      var result = jsonResponse['data']['user'];
      return User(
        id: result['id'],
        fullName: result['full_name'],
        email: result['email'],
        userName: result['username'],
        phone: result['phone'],
        phoneCountry: result['phone_country'],
        country: result['country'],
        avatar: result['avatar'],
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
      return User(
        id: result['id'],
        fullName: result['full_name'],
        email: result['email'],
        userName: result['username'],
        phone: result['phone'],
        phoneCountry: result['phone_country'],
        country: result['country'],
        avatar: result['avatar'],
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
}
