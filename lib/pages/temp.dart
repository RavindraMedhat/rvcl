import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rvcl/localData/loginData.dart';
import 'package:rvcl/routes/routes.dart';

class temp extends StatelessWidget {
  const temp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: TextButton(
            onPressed: () {
              setLogout();
              Get.offNamed(Routes.LOGIN);
            },
            child: Text(
              "login",
              selectionColor: Color.fromRGBO(0, 255, 0, 1),
            )),
      ),
    );
  }
}
