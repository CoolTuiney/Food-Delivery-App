import 'package:firebase_auth/firebase_auth.dart' as _auth;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Ui/screens/home_screen/home_screen.dart';
import 'firebase_service.dart';

class PerfromLogin {
  final FirebaseService _firebaseSerivice = FirebaseService();
  performGoogleLogin(BuildContext context) {
    _firebaseSerivice.signInUsingGoogle(context).then((_auth.User? user) {
      authenticateForGoogle(user, '', context);
    });
  }

  performEmailLogin(BuildContext context, String email, String password) {
    _firebaseSerivice
        .signInUsingEmailAndPassword(email, password, context)
        .then((_auth.User? user) {
      if (user != null) {
        Navigator.pushReplacement((context),
            MaterialPageRoute(builder: (context) {
          return const HomeScreen();
        }));
      }
    });
  }

  performEmailSignUp(
      BuildContext context, String email, String password, String name) {
    _firebaseSerivice
        .signUpUsingEmailAndPassword(email, password, context)
        .then((_auth.User? user) {
      authenticateForEmail(user, name, context);
    });
  }

  void authenticateForGoogle(
      _auth.User? user, String name, BuildContext context) {
    _firebaseSerivice.authenticateUser(user).then((isNewUser) {
      if (isNewUser) {
        _firebaseSerivice.addUserToDB(user!, name).then((value) =>
            Navigator.pushReplacement((context),
                MaterialPageRoute(builder: (context) {
              return const HomeScreen();
            })));
      } else {
        Navigator.pushReplacement((context),
            MaterialPageRoute(builder: (context) {
          return const HomeScreen();
        }));
      }
    });
  }

  void authenticateForEmail(
      _auth.User? user, String name, BuildContext context) {
    _firebaseSerivice.authenticateUser(user).then((isNewUser) {
      if (isNewUser) {
        _firebaseSerivice.addUserToDB(user!, name).then((value) =>
            Navigator.pushReplacement((context),
                MaterialPageRoute(builder: (context) {
              return const HomeScreen();
            })));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content:
                Text('Accound already exist with this email try loging in..')));
      }
    });
  }
}
