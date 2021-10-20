import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as _auth;
import 'package:flutter/material.dart';
import '../Models/food_model.dart';
import '../Models/user_model.dart';
import '../constants/constants.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  final _auth.FirebaseAuth _firebaseAuth = _auth.FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  User user = User();

  Future<_auth.User?> getCurrentUser() async {
    return _firebaseAuth.currentUser;
  }

//SIGN UP USING EMAIL
  Future<_auth.User?> signUpUsingEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      final _auth.UserCredential credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      return credential.user;
    } on Exception catch (e) {
      debugPrint("$e");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: ConstantColor.orange,
          content: Text('Email adress is already in use. Try loging in',
              style: TextStyle(fontSize: 18))));
    }
  }

//SIGN IN USING EMAIL
  Future<_auth.User?> signInUsingEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      final _auth.UserCredential credential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } catch (e) {
      debugPrint("$e");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: ConstantColor.orange,
          content: Text('Invalid Email or Password',
              style: TextStyle(fontSize: 18))));
    }
  }

//SIGN USING GOOGLE
  Future<_auth.User?> signInUsingGoogle(BuildContext context) async {
    final GoogleSignInAccount? _googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication _googleSignInAuthenticaton =
        await _googleSignInAccount!.authentication;
    try {
      final credential = _auth.GoogleAuthProvider.credential(
          accessToken: _googleSignInAuthenticaton.accessToken,
          idToken: _googleSignInAuthenticaton.idToken);
      final _auth.UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      debugPrint("$e");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Error occurred using Google Sign-In. Try again.')));
    }
  }

//SIGN OUT
  Future<void> signOut(BuildContext context) async {
    _auth.User? user = _firebaseAuth.currentUser;

    try {
      if (user!.providerData[0].providerId == 'google.com') {
        await _googleSignIn.disconnect();
        await _googleSignIn.signOut();
      }
      await _firebaseAuth.signOut();
    } on Exception catch (e) {
      debugPrint("$e");
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error signing out. Try again.')));
    }
  }

//ADD USER TO DATABASE
  Future<void> addUserToDB(_auth.User currentUser, String name) async {
    user = User(
        uid: currentUser.uid,
        name: name.isEmpty ? currentUser.displayName : name,
        profilePhoto: currentUser.photoURL,
        email: currentUser.email);
    _firebaseFirestore
        .collection("Users")
        .doc(currentUser.email)
        .set(user.toMap(user));
  }

  //AUTHENTICATE USER TO PERFORM LOGIN
  Future<bool> authenticateUser(_auth.User? user) async {
    QuerySnapshot<Map<String, dynamic>> result = await _firebaseFirestore
        .collection("Users")
        .where("email", isEqualTo: user!.email)
        .get();
    final List<DocumentSnapshot> docs = result.docs;
    return (docs.isEmpty) ? true : false;
  }

  //Adding user food item to cart in database
  Future<void> addCartToDb(String foods, int quantity) async {
    final email = await getCurrentUser().then((value) => value!.email);

    _firebaseFirestore
        .collection('Users')
        .doc(email)
        .collection('Cart')
        .doc(foods)
        .set({'food_id': foods, 'quantity': quantity});
  }

  Future<Food> getFoodDetails(String docId) async {
    QuerySnapshot<Map<String, dynamic>>? snapshot = await _firebaseFirestore
        .collection('Foods')
        .where('name', isEqualTo: docId)
        .get();
    var doc = snapshot.docs[0];
    Food food = Food(
        name: doc['name'],
        category: doc['category'],
        photoUrl: doc['url'],
        price: doc['price'],
        discount: doc['discount'],
        discription: doc['discription']);
    return food;
  }

  Future<List<Food>> getFood() async {
    List<Food> foodList = [];
    QuerySnapshot<Map<String, dynamic>>? snapshot =
        await _firebaseFirestore.collection("Foods").get();

    var docList = snapshot.docs;
    for (var doc in docList) {
      Food food = Food(
          name: doc['name'],
          category: doc['category'],
          photoUrl: doc['url'],
          price: doc['price'],
          discount: doc['discount'],
          discription: doc['discription']);
      foodList.add(food);
    }
    return foodList;
  }

  Future<List<Map<String, dynamic>>> getCart() async {
    List<Map<String, dynamic>> cart = [];
    var currentUser = await getCurrentUser();
    var snapshot = await _firebaseFirestore
        .collection("Users")
        .doc(currentUser!.email)
        .collection('Cart')
        .get();
    var docList = snapshot.docs;
    for (var doc in docList) {
      cart.add({'foodId': doc['food_id'], 'quantity': doc['quantity']});
    }
    return cart;
  }
}
