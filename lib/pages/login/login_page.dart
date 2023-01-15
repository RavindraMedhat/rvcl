import 'dart:ffi';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rvcl/localData/loginData.dart';
import 'package:rvcl/Web_Service/databaseActiviti.dart';
import 'package:rvcl/models/login_request.dart';
import 'package:rvcl/models/login_response.dart';
import 'package:rvcl/models/userInfo.dart';
import 'package:rvcl/routes/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changebutton = false;
  final _formKey = GlobalKey<FormState>();
  LoginResponse lrs = LoginResponse(success: false, role: "");
  static String pass = "";
  bool userThere = true;
  final TextEditingController loginform_password = TextEditingController();
  final TextEditingController loginform_username = TextEditingController();

  moveToHome(BuildContext context) async {
    userThere = true;
    lrs = (await loginApi.tryToLogin(LoginRequest(
        username: loginform_username.text,
        password: loginform_password.text)))!;

    if (lrs.success.toString() == "false" || lrs.success.toString() == "null") {
      userThere = (await loginApi.isUserThere(loginform_username.text))!;
    }

    if (_formKey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(const Duration(seconds: 1)); //seconds 1
      // ignore: use_build_context_synchronously
      // print("first object");

      setLogin(loginform_username.text, loginform_password.text,
          lrs.role.toString());

      userInfo.username = loginform_username.text;
      userInfo.role = lrs.role.toString();
      print(userInfo.role);
      Get.offNamed(userInfo.username == ""
          ? Routes.LOGIN
          : userInfo.role == "customer"
              ? Routes.CUSTOMERHOME
              : userInfo.role == "employee"
                  ? Routes.EMPLOYEEHOME
                  : userInfo.role == "owner"
                      ? Routes.OWNERHOME
                      : userInfo.role == "accounter"
                          ? Routes.ACCOUNTERHOME
                          : Routes.temp);
      // closeApp(context);

      setState(() {
        changebutton = false;
        loginform_password.clear();
        loginform_username.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/login_image.png',
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome ${loginform_username.text}",
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: loginform_username,
                        decoration: const InputDecoration(
                            hintText: "Enter User Name",
                            labelText: "User Name"),
                        validator: (value) {
                          print("paswor :- $pass");
                          sleep(const Duration(seconds: 1));
                          if (value!.isEmpty) {
                            return "Usrename can not be empty";
                          } else if (!userThere) {
                            return "User name not mach";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) async {
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: loginform_password,
                        decoration: const InputDecoration(
                            hintText: "Enter Password", labelText: "Password"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "password can not be empty";
                          } else if (userThere &&
                              lrs.success.toString() == "false") {
                            return "Enter corect password";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Material(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(15),
                  child: InkWell(
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 5),
                      height: 40,
                      width: 100,
                      alignment: Alignment.center,
                      child: changebutton
                          ? const Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Material(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(15),
                  child: InkWell(
                    onTap: () => Get.offNamed(Routes.SIGNUP),
                    // Navigator.pushNamed(context, MyRoultes.singUp_roultr),
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 5),
                      height: 40,
                      width: 100,
                      alignment: Alignment.center,
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// Image.asset("assets/images/login_image.png")