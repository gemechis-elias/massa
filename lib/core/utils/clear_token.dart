import 'package:shared_preferences/shared_preferences.dart';

Future<void> clearAuthToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove("auth_token");
}
