import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {

  Future<bool> isLoggedIn(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? user = prefs.getString(key);
    return user != null;
  }

  Future<void> saveUser(Map<String, dynamic> user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(user);
    prefs.setString('user', jsonString);
  }

  Future<Map<String, dynamic>> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('user');
    return jsonDecode(data!);
  }

  Future<void> clearSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    print('cleared');
  }


}
