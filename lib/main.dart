import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palindrome_app/app/bindings.dart';
import 'app/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Palindrome Checker',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: Pages.home,
      initialBinding: AppBindings(),
      getPages: Pages.routes,
    );
  }
}