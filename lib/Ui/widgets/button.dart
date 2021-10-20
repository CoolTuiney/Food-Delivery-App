import 'package:flutter/material.dart';
import '../../constants/constants.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.size,
    required this.text,
    required this.onPress,
    this.actionWidget = const SizedBox(),
    this.borderColor = ConstantColor.orange,
    this.color = ConstantColor.orange,
    this.leadingWidget = const SizedBox(),
    this.textColor = Colors.white,
  }) : super(key: key);

  final Size size;
  final String text;
  final VoidCallback onPress;
  Color? borderColor;
  Color? color;
  Color? textColor;
  Widget? leadingWidget;
  Widget? actionWidget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        height: size.height * 0.06,
        width: size.width,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor!, width: 2),
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            leadingWidget!,
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  letterSpacing: 1),
            ),
            const SizedBox(
              width: 10,
            ),
            actionWidget!,
          ],
        ),
      ),
    );
  }
}
