import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as _auth;
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Ui/screens/splash_screen/splash_screen.dart';
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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SplashScreen()),
      );
    } on Exception catch (e) {
      debugPrint("$e");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: ConstantColor.orange,
          content: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Error while trying to signing out',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                  fontSize: 15),
            ),
          )));
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

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getCart() async {
    var currentUser = await getCurrentUser();
    var snapshot = _firebaseFirestore
        .collection("Users")
        .doc(currentUser!.email)
        .collection('Cart')
        .snapshots();
    return snapshot;
  }

  void addItemToCart(String foodName, int quantity) async {
    var currentUser = await getCurrentUser();
    _firebaseFirestore
        .collection("Users")
        .doc(currentUser!.email)
        .collection('Cart')
        .doc(foodName)
        .set({'food_id': foodName, 'quantity': quantity});
  }

  void removeItemFromCart(String foodName) async {
    var currentuser = await getCurrentUser();
    _firebaseFirestore
        .collection('Users')
        .doc(currentuser!.email)
        .collection('Cart')
        .doc(foodName)
        .delete();
  }

  Future<Food> searchFoodItemById(String id) async {
    var food = _firebaseFirestore
        .collection('Foods')
        .where('name', isEqualTo: id)
        .get()
        .then((doc) => Food(
            name: doc.docs[0]['name'],
            category: doc.docs[0]['category'],
            photoUrl: doc.docs[0]['url'],
            price: doc.docs[0]['price'],
            discount: doc.docs[0]['discount'],
            discription: doc.docs[0]['discription']));

    return food;
  }

  void updateQuantityOfCartItem(String id, int quantity) async {
    var currentUser = await getCurrentUser();
    _firebaseFirestore
        .collection('Users')
        .doc(currentUser!.email)
        .collection('Cart')
        .doc(id)
        .update({'quantity': quantity});
  }

  void updateUserName(String firstName,String lastName) async{
    String name = firstName +" "+ lastName;
    var currentUser = await getCurrentUser();
    _firebaseFirestore.collection('Users').doc(currentUser!.email).update({'name': name});
  }
  void updateUserMobile(int number) async{
  
    var currentUser = await getCurrentUser();
    _firebaseFirestore.collection('Users').doc(currentUser!.email).update({'mobile_no': number});
  }
}
