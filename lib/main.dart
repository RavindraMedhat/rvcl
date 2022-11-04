import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rvcl/routes/routes.dart';
import 'package:rvcl/models/databaseActiviti.dart';

Future<void> main() async {
  await mongoDataBase.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "RVCL",
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
    );
  }
}
