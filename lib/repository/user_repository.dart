import 'package:firebase_auth/firebase_auth.dart' as _auth;
import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/services/firebase_service.dart';

class UserRepository {
  final FirebaseService _firebaseService = FirebaseService();
  Future<_auth.User?> getCurrentUser() => _firebaseService.getCurrentUser();
  Future<void> signOut(BuildContext context) =>
      _firebaseService.signOut(context);
  void updateUserInfo(String firstName, String lastName) =>
      _firebaseService.updateUserName(firstName, lastName);
      void updateUserNumber(int number)=> _firebaseService.updateUserMobile(number);
}
