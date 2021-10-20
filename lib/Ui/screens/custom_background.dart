import 'package:flutter/material.dart';
import '../../constants.dart';

// ignore: must_be_immutable
class CustomBackground extends StatelessWidget {
  CustomBackground({
    Key? key,
    required this.size,
    this.widget,
  }) : super(key: key);

  final Size size;
  Widget? widget = const SizedBox();

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClippingClass(),
      child: Container(
        height: size.height * 0.25,
        width: size.width,
        color: ConstantColor.orange,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset("assets/images/top_right.png"),
            ),
            Positioned(
              bottom: 50,
              left: 0,
              child: Image.asset(
                "assets/images/topleft.png",
              ),
            ),
            (widget != null) ? widget! : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.80);
    path.quadraticBezierTo(
        size.width / 2, size.height + 20, size.width, size.height * 0.80);

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
