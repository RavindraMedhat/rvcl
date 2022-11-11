import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rvcl/models/databaseActiviti.dart';
import 'package:rvcl/models/login_request.dart';
import 'package:rvcl/routes/routes.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  // String name = "";
  LoginRequest sr = LoginRequest(password: "", username: "", role: "");
  bool changebutton = false;
  bool userThere = true;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      mongoDataBase.AddUser(sr);
      await Get.offNamed(Routes.temp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                'assets/images/hey.png',
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Sign Up",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                      decoration: const InputDecoration(
                          hintText: "Enter User Name", labelText: "User Name"),
                      validator: (value) {
                        sr.username = value.toString();
                        sr.role = "customer";
                        if (value!.isEmpty) {
                          return "Usrename can not be empty";
                        } else if (userThere) {
                          return "Username alredy used";
                        }
                        return null;
                      },
                      onChanged: (value) async {
                        userThere =
                            await mongoDataBase.isUserThere(value.toString());
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Enter Password", labelText: "Password"),
                      validator: (value) {
                        sr.password = value.toString();
                        if (value!.isEmpty) {
                          return "password can not be empty";
                        } else if (value.length < 6) {
                          return "password length atleast 6";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Confirm Password"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password can not be empty";
                        } else if (value.toString() != sr.password) {
                          return "password not mach";
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
    );
  }
}
// Image.asset("assets/images/login_image.png")
