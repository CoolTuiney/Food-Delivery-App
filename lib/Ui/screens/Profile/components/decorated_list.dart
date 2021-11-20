import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/constants.dart';

class DecoratedListMenu extends StatelessWidget {
  const DecoratedListMenu({
    Key? key,
    required this.iconSize,
    required this.onPress,
    required this.title,
    required this.icon,
    required this.textSize,
  }) : super(key: key);

  final double textSize;
  final double iconSize;
  final String title;
  final VoidCallback onPress;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: InkWell(
        onTap: onPress,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
              color: ConstantColor.orange,
              borderRadius: BorderRadius.circular(20)),
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(fontSize: textSize, color: Colors.white),
            ),
            leading: Icon(
              icon,
              size: iconSize + 15,
              color: Colors.white,
            ),
            trailing: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  shape: BoxShape.circle),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                size: iconSize,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
