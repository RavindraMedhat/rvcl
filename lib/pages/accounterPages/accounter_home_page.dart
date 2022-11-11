import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rvcl/localData/loginData.dart';
import 'package:rvcl/routes/routes.dart';

class accounterHomePage extends StatelessWidget {
  const accounterHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 300,
              ),
              Text("accounter home page"),
              SizedBox(
                height: 300,
              ),
              TextButton(
                  onPressed: () {
                    setLogout();
                    Get.offNamed(Routes.LOGIN);
                  },
                  child: Text(
                    "log out",
                    selectionColor: Color.fromRGBO(0, 255, 0, 1),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}