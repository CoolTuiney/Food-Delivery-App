import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/sign_up/sign_up_body.dart';

class SignUpSCreen extends StatelessWidget {
  const SignUpSCreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpBody(),
    );
  }
}
