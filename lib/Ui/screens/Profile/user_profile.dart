import 'package:flutter/material.dart';
import 'package:food_delivery_app/Ui/screens/Profile/user_profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: UserProfileBody(),
    );
  }
}
