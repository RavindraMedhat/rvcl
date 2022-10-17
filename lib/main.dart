import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Material(
          child: Center(
              child: Text(
        "app making work on",
        style: TextStyle(fontSize: 100),
      ))),
    );
  }
}
