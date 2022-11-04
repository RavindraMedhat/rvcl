import 'package:get/get.dart';
import 'package:rvcl/pages/login/login_page.dart';
import 'package:rvcl/pages/login/sign_Up_Page.dart';
import 'package:rvcl/pages/temp.dart';

class Routes {
  static const LOGIN = "/login";
  static const SIGNUP = "/signup";
  static const temp = "/temp";
}

class AppPages {
  static final initial = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.temp,
      page: () => temp(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => SingUpPage(),
    )
  ];
}
