import 'package:flutter/material.dart';

class LogoName extends StatelessWidget {
  final double height;
  final double fontsize;
  const LogoName({
    Key? key,
    required this.height,
    required this.fontsize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/logo.png",
          height: height,
        ),
        Text(
          "Meals On Wheels",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: fontsize,
              letterSpacing: 1),
        ),
      ],
    );
  }
}
