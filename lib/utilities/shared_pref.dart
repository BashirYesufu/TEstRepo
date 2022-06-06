import 'package:shared_preferences/shared_preferences.dart';

class Shared {

  static const onboarded = 'onboarded';
  static const userToken = 'userToken';
  static const userEmail = 'userEmail';

  static Future<void> setBoolean(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  static Future<bool> getBoolean(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final bool? value = prefs.getBool(key);
    if (value == true) {
      return true;
    } else {
      return false;
    }
  }

  static Future<void> setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(key);
    return value;
  }
}