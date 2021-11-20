import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/constants.dart';

class CustomAlertBox extends StatelessWidget {
  const CustomAlertBox({Key? key, required this.onPress}) : super(key: key);
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: ConstantColor.orange,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)), //this right here
        child: SizedBox(
          height: 250.0,
          width: 200.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Confirm Purchase',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        letterSpacing: 0.9,
                        fontWeight: FontWeight.bold)),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: 100,
                          width: 65,
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.close,
                            color: ConstantColor.orange,
                            size: 30,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: onPress,
                        child: Container(
                          height: 100,
                          width: 65,
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.check,
                            color: ConstantColor.orange,
                            size: 30,
                          ),
                        ),
                      )
                    ]),
              ],
            ),
          ),
        ));
  }
}
