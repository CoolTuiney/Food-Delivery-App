import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Models/food_model.dart';
import 'package:food_delivery_app/screens/custom_background.dart';
import 'package:food_delivery_app/services/firebase_auth.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore _firestoreFirebase = FirebaseFirestore.instance;
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        CustomBackground(
          size: size,
          widget: const Center(
            child: Text(
              'Your Cart',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8),
            ),
          ),
        ),
        Column(
          children: [
            StreamBuilder(
                stream: _firestoreFirebase
                    .collection('Users')
                    .doc(_firebaseAuth.currentUser!.email)
                    .collection('Cart')
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  var doc = snapshot.data!.docs;
                  return Column(
                    children: [
                      // ListView.builder(
                      //     itemCount: doc.length,
                      //     itemBuilder: (context, int index) {
                      //       Future<Food?> food =
                      //           retrieveFoodDetails(doc[index]['name']);
                      //     })
                    ],
                  );
                })
          ],
        )
      ],
    );
  }

  // Food? retrieveFoodDetails(QueryDocumentSnapshot doc)  {
  //   var docId = doc.reference.id;
  //   var collection = FirebaseFirestore.instance
  //       .collection('Foods')
  //       .doc(docId)
  //       .get()
  //       .then((value) => Food.fromMap(value));

  //   return collection;
  // }
}
