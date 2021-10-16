import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as _auth;
import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/screens/home_screen/home_screen.dart';
import 'package:food_delivery_app/screens/login/login_screen.dart';
import 'package:food_delivery_app/services/firebase_auth.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseService _firebaseService = FirebaseService();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => FutureBuilder(
                    future: _firebaseService.getCurrentUser(),
                    builder: (context, AsyncSnapshot<_auth.User?> snapshot) {
                      if (snapshot.hasData) {
                        return const HomeScreen();
                      } else {
                        return const LoginScreen();
                      }
                    },
                  )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            gradient: ConstantColor.splashScreenGradient,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: 160,
              ),
              Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: Colors.black45,
                child: const Text(
                  "Meals On Wheels",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      letterSpacing: 1),
                ),
              ),
            ],
          )),
    );
  }
}
