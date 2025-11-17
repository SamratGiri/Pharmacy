import 'package:flutter/material.dart';
import 'package:pharmacy/pages/detail_page.dart';
import 'package:pharmacy/pages/homepage.dart';
import 'package:pharmacy/pages/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pharmacy',
      debugShowCheckedModeBanner: false,

      home: LoginPage(),
    );
  }
}
