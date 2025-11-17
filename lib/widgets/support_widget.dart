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

  static TextStyle whiteLineText(double size) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: size,
      color: const Color.fromARGB(255, 18, 17, 17),
    );
  }

  static TextStyle fredokabold(double size) {
    return TextStyle(
      fontFamily: 'Fredoka-Bold',
      fontSize: size,
      color: Colors.black,
    );
  }

  static TextStyle fredokalight(double size) {
    return TextStyle(
      fontFamily: 'Fredoka-Light',
      fontSize: size,
      color: Colors.black,
    );
  }

  static Widget selectedCategory(String name) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        height: 50,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 100, 78, 146),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins-Regular',
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
