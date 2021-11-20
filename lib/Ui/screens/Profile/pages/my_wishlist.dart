import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Models/food_model.dart';
import 'package:food_delivery_app/Ui/screens/Profile/components/user_info.dart';
import 'package:food_delivery_app/Ui/screens/custom_background.dart';
import 'package:firebase_auth/firebase_auth.dart' as _auth;
import 'package:food_delivery_app/Ui/screens/search/components/list_of_food.dart';
import 'package:food_delivery_app/Ui/screens/search/search_screen_body.dart';
import 'package:food_delivery_app/repository/wishlist_repo.dart';

class MyWishlist extends StatefulWidget {
  const MyWishlist({Key? key, required this.user}) : super(key: key);
  final _auth.User user;

  @override
  State<MyWishlist> createState() => _MyWishlistState();
}

class _MyWishlistState extends State<MyWishlist> {
  final WishlistRepository _wishlistRepository = WishlistRepository();
  late Future<Stream> _future;
  @override
  void initState() {
    _future = _wishlistRepository.getWishlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          CustomBackground(
            size: size,
            widget: UserInfo(
              hasBackButton: true,
              user: widget.user,
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _future,
              builder: (BuildContext context, AsyncSnapshot futureSnapshot) {
                return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: futureSnapshot.data,
                    builder: (BuildContext context, streamSnap) {
                      if (streamSnap.hasData) {
                        if (streamSnap.data!.size > 0) {
                          return ListView.builder(
                              itemCount: streamSnap.data!.size,
                              itemBuilder: (context, index) {
                                var doc = streamSnap.data!.docs[index];
                                String searchName = doc.data()['food_name'];
                                debugPrint(searchName);

                                return FutureBuilder<Food>(
                                  future: _wishlistRepository
                                      .searchItem(searchName),
                                  builder: (BuildContext context, food) {
                                    if (food.hasData) {
                                      return ListOfFood(
                                          hasRomveButton: true,
                                          onPress: () {
                                            _wishlistRepository
                                                .removeItemFromWishList(
                                                    food.data!.name!);
                                          },
                                          context: context,
                                          food: food.data!);
                                    } else {
                                      return const SizedBox();
                                    }
                                  },
                                );
                              });
                        } else {
                          return const Center(
                            child: Text(
                              'Wishlist is empty',
                              style: TextStyle(
                                  fontSize: 25, color: Colors.black45),
                            ),
                          );
                        }
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
