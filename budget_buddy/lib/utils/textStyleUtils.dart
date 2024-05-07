import 'dart:ui';

import 'package:flutter/material.dart';

class TextUtils {
  static TextStyle getPoppinsTextStyle({
    String fontFamily = 'Poppins',
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
    double fontSize = 14.0,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
      fontSize: fontSize,
    );
  }

  static TextStyle getPoppinsRegular({
    Color color = Colors.black,
    double fontSize = 14.0,
  }) {
    return getPoppinsTextStyle(
      fontWeight: FontWeight.normal,
      color: color,
      fontSize: fontSize,
    );
  }

  static TextStyle getPoppinsBold({
    Color color = Colors.black,
    double fontSize = 14.0,
  }) {
    return getPoppinsTextStyle(
      fontWeight: FontWeight.bold,
      color: color,
      fontSize: fontSize,
    );
  }

  static TextStyle getPoppinsExtraBold({
    Color color = Colors.black,
    double fontSize = 14.0,
  }) {
    return getPoppinsTextStyle(
      fontWeight: FontWeight.w800,
      color: color,
      fontSize: fontSize,
    );
  }

  static TextStyle getPoppinsLight({
    Color color = Colors.black,
    double fontSize = 14.0,
  }) {
    return getPoppinsTextStyle(
      fontWeight: FontWeight.w300,
      color: color,
      fontSize: fontSize,
    );
  }

  static TextStyle getPoppinsMedium({
    Color color = Colors.black,
    double fontSize = 14.0,
  }) {
    return getPoppinsTextStyle(
      fontWeight: FontWeight.w500,
      color: color,
      fontSize: fontSize,
    );
  }

  static TextStyle getPoppinsSemiBold({
    Color color = Colors.black,
    double fontSize = 14.0,
  }) {
    return getPoppinsTextStyle(
      fontWeight: FontWeight.w600,
      color: color,
      fontSize: fontSize,
    );
  }
}