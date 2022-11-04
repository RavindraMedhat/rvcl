import 'dart:ffi';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rvcl/models/databaseActiviti.dart';
import 'package:rvcl/models/login_request.dart';
import 'package:rvcl/routes/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changebutton = false;
  final _formKey = GlobalKey<FormState>();
  static String pass = "";
  final TextEditingController loginform_password = TextEditingController();
  final TextEditingController loginform_username = TextEditingController();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(const Duration(seconds: 1)); //seconds 1
      // ignore: use_build_context_synchronously
      // print("first object");

      // setLogin(userinfo.username, userinfo.userProfile);

      Get.offNamed(Routes.temp);
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
                          } else if (pass == "null") {
                            return "User name not mach";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) async {
                          LoginRequest tlr = LoginRequest(
                              username: loginform_username.text,
                              password: loginform_password.text);
                          var lr = await mongoDataBase.tryToLogin(tlr);
                          print(lr.toString());
                          if (lr.length != 0) {
                            pass = lr[0]['password'].toString();
                          } else {
                            pass = "null";
                          }
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
                            // pass = "";
                            return "password can not be empty";
                          } else if (value != pass) {
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