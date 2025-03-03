import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static Future<bool> registerUser(
    String name, String email, String phone, String location) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('email', email);
    await prefs.setString('phone', phone);
    await prefs.setString('location', location);
    await prefs.setBool('isLoggedIn', false);
    return true;
  }

  static Future<bool> loginUser(String email, String phone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('email');
    String? savedPhone = prefs.getString('phone');

    if (email == savedEmail && phone == savedPhone) {
      await prefs.setBool('isLoggedIn', true);
      return true;
    }
    return false;
  }
}