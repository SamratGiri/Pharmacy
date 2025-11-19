import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/admin/add_product.dart';
import 'package:pharmacy/admin/admin_login.dart';
import 'package:pharmacy/pages/bottom_nav.dart';
import 'package:pharmacy/pages/detail_page.dart';
import 'package:pharmacy/pages/homepage.dart';
import 'package:pharmacy/pages/loginpage.dart';
import 'package:pharmacy/pages/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

      home: BottomNav(),
    );
  }
}
