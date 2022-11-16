import 'package:get/get.dart';
import 'package:rvcl/models/userInfo.dart';
import 'package:rvcl/pages/accounterPages/accounter_home_page.dart';
import 'package:rvcl/pages/customerPages/customer_home_page.dart';
import 'package:rvcl/pages/employeePages/employee_home_page.dart';
import 'package:rvcl/pages/login/login_page.dart';
import 'package:rvcl/pages/login/sign_Up_Page.dart';
import 'package:rvcl/pages/ownerPages/owner_home_page.dart';
import 'package:rvcl/pages/temp.dart';
import 'package:rvcl/splash.dart';

class Routes {
  static const LOGIN = "/login";
  static const SIGNUP = "/signup";
  static const CUSTOMERHOME = "/customerHome";
  static const OWNERHOME = "/ownerHome";
  static const ACCOUNTERHOME = "/accounter";
  static const EMPLOYEEHOME = "/employeeHome";
  static const SPLASH = "/splashPage";

  static const temp = "/temp";
}

class AppPages {
  static final initial = userInfo.username == ""
      ? Routes.LOGIN
      : userInfo.role == "customer"
          ? Routes.CUSTOMERHOME
          : userInfo.role == "employee"
              ? Routes.EMPLOYEEHOME
              : userInfo.role == "owner"
                  ? Routes.OWNERHOME
                  : userInfo.role == "accounter"
                      ? Routes.ACCOUNTERHOME
                      : Routes.temp;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => splash(),
    ),
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
    ),
    GetPage(
      name: Routes.CUSTOMERHOME,
      page: () => customerHomePage(),
    ),
    GetPage(
      name: Routes.OWNERHOME,
      page: () => ownerHomePage(),
    ),
    GetPage(
      name: Routes.EMPLOYEEHOME,
      page: () => employeeHomePage(),
    ),
    GetPage(
      name: Routes.ACCOUNTERHOME,
      page: () => accounterHomePage(),
    )
  ];
}
