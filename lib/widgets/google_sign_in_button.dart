import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({
    Key? key,
    required this.size,
    required this.onPress,
  }) : super(key: key);

  final Size size;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          alignment: Alignment.center,
          height: size.height * 0.06,
          width: size.width * 0.80,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black45, width: 3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/images/google_logo.png",
                height: 30,
              ),
              const Text(
                "Sign In With Google",
                style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    letterSpacing: 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
