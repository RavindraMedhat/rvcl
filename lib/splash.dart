import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rvcl/localData/loginData.dart';
import 'package:rvcl/Web_Service/databaseActiviti.dart';
import 'package:rvcl/routes/routes.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  String msg = "";
  Connectivity connectivity = Connectivity();

  Future<bool> checkCon() async {
    var conResult = await connectivity.checkConnectivity();
    if (conResult == ConnectivityResult.mobile ||
        conResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  setUp() async {
    if (await checkCon()) {
      print("yes");
      // await loginApi.connect(); 
      await checkLogin();
      Get.offAllNamed(AppPages.initial);
    } else {
      print("no");
      msg = "check your internet";
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    setUp();
    // checkConR();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              child: const Text(
                "RVCL",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(msg)
          ],
        ),
      ),
    );
  }
}
