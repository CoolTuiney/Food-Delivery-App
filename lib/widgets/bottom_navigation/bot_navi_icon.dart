import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';

// ignore: must_be_immutable
class CustomBotNavigationIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPress;
  bool isPressed;

  CustomBotNavigationIcon(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onPress,
      required this.isPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: (isPressed)
          ? const BoxDecoration(
              border: Border(
                  top: BorderSide(color: ConstantColor.orange, width: 2)))
          : const BoxDecoration(),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: (isPressed) ? ConstantColor.black : Colors.black45,
                size: 25,
              ),
              Text(text,
                  style: TextStyle(
                      color: (isPressed) ? Colors.black : Colors.black45,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      letterSpacing: 1))
            ],
          ),
          onTap: onPress,
        ),
      ),
    );
  }
}
