import 'package:flutter/material.dart';
import 'package:food_delivery_app/Ui/screens/Profile/components/user_info.dart';
import 'package:food_delivery_app/Ui/screens/custom_background.dart';
import 'package:firebase_auth/firebase_auth.dart' as _auth;
import 'package:food_delivery_app/Ui/widgets/button.dart';
import 'package:food_delivery_app/Ui/widgets/custom_text_field.dart';
import 'package:food_delivery_app/constants/constants.dart';
import 'package:food_delivery_app/repository/user_repository.dart';

class MyAccount extends StatelessWidget {
  MyAccount({Key? key, required this.user}) : super(key: key);
  final _auth.User user;
  final _firstNameKey = GlobalKey<FormState>();
  final _lastNameKey = GlobalKey<FormState>();
  final _mobileNoKey = GlobalKey<FormState>();
  final UserRepository _userRepository = UserRepository();
  String firstName = '';
  String lastName = '';
  String mobileNo = '';
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomBackground(
              size: size,
              widget: UserInfo(
                hasBackButton: true,
                user: user,
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text(
                  'Personal Information:',
                  style: TextStyle(
                      fontSize: 25,
                      color: ConstantColor.orange,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.9),
                ),
              ),
            ),
            Form(
                key: _firstNameKey,
                child: textFields(size, 'First Name', (val) {
                  firstName = val;
                })),
            Form(
                key: _lastNameKey,
                child: textFields(size, 'Last Name', (val) {
                  lastName = val;
                })),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              child: CustomButton(
                  size: size,
                  text: 'Submit',
                  onPress: () {
                    bool isFirstName = _firstNameKey.currentState!.validate();
                    bool isLastName = _lastNameKey.currentState!.validate();
                    if (isFirstName && isLastName) {
                      _userRepository.updateUserInfo(firstName, lastName);
                    }
                  }),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text(
                  ' Mobile Number:',
                  style: TextStyle(
                      fontSize: 25,
                      color: ConstantColor.orange,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.9),
                ),
              ),
            ),
            Form(
                key: _mobileNoKey,
                child: textFields(size, 'Mobile No.', (val) {
                  mobileNo = val;
                })),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              child: CustomButton(
                  size: size,
                  text: 'Submit',
                  onPress: () {
                    bool isMobileValide = _mobileNoKey.currentState!.validate();
                    if (isMobileValide) {
                      _userRepository.updateUserNumber(int.parse(mobileNo));
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }

  Padding textFields(Size size, String text, Function(String) onPress) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: CustomTextField(
          size: size, onPress: onPress, icon: Icons.person, textHint: text),
    );
  }
}
