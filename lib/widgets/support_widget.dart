import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle boldLineText(double size) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: size,
      color: Colors.black,
    );
  }

  static TextStyle lightLineText(double size) {
    return TextStyle(
      fontFamily: 'Poppins-Regular',
      fontSize: size,
      color: Colors.black,
    );
  }
}
