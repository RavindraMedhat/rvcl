import 'package:rvcl/models/userInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> checkLogin() async {
  bool cl = false;
  final prefs = await SharedPreferences.getInstance();

  String? un = prefs.getString("userName");
  String? up = prefs.getString("userProfile");
  String? ro = prefs.getString("role");

  print("check info user name :- $un");
  
  if (un == null) {
    cl = false;
  } else {
    userInfo.username = un;
    userInfo.role = ro!;
    cl = true;
  }

  print("username at checkLogin :- ${userInfo.username}");
}

Future<void> setLogin(String un, String up, String ro) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString("userName", un);
  await prefs.setString("userProfile", up);
  await prefs.setString("role", ro);
}

Future<void> setLogout() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove("userName");
  await prefs.remove("userProfile");
  await prefs.remove("role");
}
