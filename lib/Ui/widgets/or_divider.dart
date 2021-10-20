import 'package:flutter/material.dart';
import '../../constants.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Expanded(
          child: Divider(
            thickness: 2,
            color: ConstantColor.black,
          ),
        ),
        Text("  OR  ",
            style: TextStyle(
                color: ConstantColor.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                letterSpacing: 1)),
        Expanded(
          child: Divider(
            thickness: 2,
            color: ConstantColor.black,
          ),
        ),
      ],
    );
  }
}
