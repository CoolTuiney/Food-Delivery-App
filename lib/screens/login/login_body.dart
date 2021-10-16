import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/screens/custom_background.dart';
import 'package:food_delivery_app/screens/sign_up/sign_up_screen.dart';
import 'package:food_delivery_app/services/perform_loign.dart';
import 'package:food_delivery_app/widgets/button.dart';
import 'package:food_delivery_app/widgets/custom_text_field.dart';
import 'package:food_delivery_app/widgets/google_sign_in_button.dart';
import 'package:food_delivery_app/widgets/logo.dart';
import 'package:food_delivery_app/widgets/or_divider.dart';
import 'package:food_delivery_app/widgets/password_text_field.dart';

// ignore: must_be_immutable
class LoginBody extends StatelessWidget {
  LoginBody({Key? key}) : super(key: key);
  final _formKeyEmail = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();
  final PerfromLogin _perfromLogin = PerfromLogin();

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          Stack(
            children: [
              CustomBackground(size: size),
              const Positioned(
                right: 0,
                left: 0,
                top: 0,
                child: Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 40),
                  child: LogoName(
                    fontsize: 17,
                    height: 70,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Form(
                  key: _formKeyEmail,
                  child: CustomTextField(
                    icon: Icons.email_outlined,
                    textHint: "Email",
                    size: size,
                    onPress: (val) {
                      email = val;
                    },
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Form(
                  key: _formKeyPassword,
                  child: TextFieldPassword(
                    size: size,
                    onPress: (val) {
                      password = val;
                    },
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password ?",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: ConstantColor.lightOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        letterSpacing: 1),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: CustomButton(
                    onPress: () {
                      final emailForm = _formKeyEmail.currentState;
                      final passwordForm = _formKeyPassword.currentState;
                      emailForm!.validate();
                      passwordForm!.validate();
                      if (emailForm.validate() && passwordForm.validate()) {
                        _perfromLogin.performEmailLogin(
                            context, email, password);
                      }
                    },
                    size: size,
                    text: "LOGIN",
                  ),
                ),
                const OrDivider(),
                GoogleSignInButton(
                  size: size,
                  onPress: () async {
                    _perfromLogin.performGoogleLogin(context);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Dont Have an Account ?",
                      style: TextStyle(
                          color: ConstantColor.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          letterSpacing: 1),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const SignUpSCreen();
                        }));
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: ConstantColor.lightOrange,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            letterSpacing: 1),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
