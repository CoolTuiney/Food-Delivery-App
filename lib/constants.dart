import 'package:flutter/material.dart';

class ConstantColor {
  static const Color orange = Color(0xfffe4040);
  static const Color lightOrange = Color(0xffff6238);
  static const Color black = Color(0xff312f31);
  static const Color startGradient = Color(0xfffe4040);
  static const Color endGradient = Color(0xffff6238);
  static const splashScreenGradient = LinearGradient(
    colors: [startGradient, endGradient],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
