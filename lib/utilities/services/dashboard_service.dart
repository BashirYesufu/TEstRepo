import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../constants/string_literals.dart';
import '../shared_pref.dart';

class DashBoardService {
  Future<String> getDashBoardSecret() async {
    String? token = await Shared.getString(Shared.userToken);
    try {
      var url = Uri.parse(ApiEndPoints.dashboard);
      var response = await http.get(url, headers: {
        'Authorization': 'Bearer $token',
      });
      var jsonResponse = jsonDecode(response.body.toString()) as Map<String, dynamic>;
      String secret = jsonResponse['data']['secret'];
      return secret;
    } catch (e) {
      rethrow;
    }
  }
}