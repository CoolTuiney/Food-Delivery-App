import 'package:flutter/material.dart';
import 'package:food_delivery_app/Ui/screens/login/login_screen.dart';
import 'package:food_delivery_app/Ui/widgets/button.dart';
import 'package:food_delivery_app/Ui/widgets/custom_text_field.dart';
import 'package:food_delivery_app/Ui/widgets/google_sign_in_button.dart';
import 'package:food_delivery_app/Ui/widgets/logo.dart';
import 'package:food_delivery_app/Ui/widgets/or_divider.dart';
import 'package:food_delivery_app/Ui/widgets/password_text_field.dart';
import 'package:food_delivery_app/services/perform_loign.dart';

import '../../../constants/constants.dart';
import '../custom_background.dart';

// ignore: must_be_immutable
class SignUpBody extends StatelessWidget {
  final _formKeyEmail = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();
  final _formKeyName = GlobalKey<FormState>();

  SignUpBody({Key? key}) : super(key: key);
  String email = '';
  String password = '';
  String name = '';
  final PerfromLogin _perfromLogin = PerfromLogin();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
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
                  key: _formKeyName,
                  child: CustomTextField(
                    icon: Icons.person_outline,
                    textHint: "Name",
                    size: size,
                    onPress: (val) {
                      name = val;
                    },
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Form(
                  key: _formKeyEmail,
                  child: CustomTextField(
                    icon: Icons.mail_outline,
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: CustomButton(
                    onPress: () async {
                      final emailForm = _formKeyEmail.currentState;
                      final passwordForm = _formKeyPassword.currentState;
                      final nameForm = _formKeyName.currentState;
                      emailForm!.validate();
                      passwordForm!.validate();
                      nameForm!.validate();

                      if (emailForm.validate() &&
                          passwordForm.validate() &&
                          nameForm.validate()) {
                        _perfromLogin.performEmailSignUp(
                            context, email, password, name);
                      }
                    },
                    size: size,
                    text: "SIGN UP",
                  ),
                ),
                const OrDivider(),
                GoogleSignInButton(
                    size: size,
                    onPress: () async {
                      _perfromLogin.performGoogleLogin(context);
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already Have an Account ?",
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
                          return const LoginScreen();
                        }));
                      },
                      child: const Text(
                        "Login",
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
