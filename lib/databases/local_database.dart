import 'package:shared_preferences/shared_preferences.dart';

class LocalDatabase {
  LocalDatabase();

  Future<void> saveUserToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('USER_TOKEN', token);
  }

  Future<String?> getUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('USER_TOKEN');
  }
}
