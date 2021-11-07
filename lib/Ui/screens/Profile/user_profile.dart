import 'package:flutter/material.dart';
import 'package:food_delivery_app/services/firebase_service.dart';

import '../splash_screen/splash_screen.dart';

class ProfileScreen extends StatelessWidget {
  final FirebaseService _firebaseService = FirebaseService();
  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: TextButton(
        onPressed: () async {
          await _firebaseService.signOut(context);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const SplashScreen();
          }));
        },
        child: const Text(
          "Sign Out",
          style: TextStyle(fontSize: 20),
        ),
      ),
    ));
  }
}
