import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Models/food_model.dart';
import '../../../../constants.dart';
import '../../food_detail_screen/food_detail_screen.dart';

class FoodList extends StatelessWidget {
  const FoodList({
    Key? key,
    required this.size,
    required this.title,
  }) : super(key: key);

  final Size size;

  final String title;

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
    return StreamBuilder(
        stream: _firebaseFirestore.collection('Foods').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.data != null) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        title,
                        style: const TextStyle(
                            color: ConstantColor.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    height: size.height * 0.20,
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, int index) {
                              var doc = snapshot.data!.docs[index];
                              var discount = doc['discount'];
                              if (discount >= 20) {
                                return foodImage(doc, context);
                              }
                              return const SizedBox();
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }
          return const CircularProgressIndicator();
        });
  }

  Padding foodImage(QueryDocumentSnapshot<Object?> doc, BuildContext context) {
    final Random random = Random();
    final String name = doc['name'];
    final tag = name + random.nextInt(1000).toString();
    final String url = doc['url'];
    final String discription = doc['discription'];
    final int price = doc['price'];
    final int discount = doc['discount'];
    final List<dynamic> category = doc['category'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: size.height * 0.20,
        width: size.width * 0.50,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 2,
                spreadRadius: 1,
                offset: Offset.fromDirection(3, 5))
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            child: Hero(
              tag: tag,
              child: Image.network(
                url,
                fit: BoxFit.fill,
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                Food food = Food(
                    name: name,
                    photoUrl: url,
                    discount: discount,
                    price: price,
                    discription: discription,
                    category: category);
                return FoodDetailScreen(
                  food: food,
                  tag: tag,
                );
              }));
            },
          ),
        ),
      ),
    );
  }
}
