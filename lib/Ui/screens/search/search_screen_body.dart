import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Models/food_model.dart';
import 'package:food_delivery_app/Ui/widgets/custom_text_field.dart';
import 'package:food_delivery_app/repository/search_repository.dart';

class SearchScreenBody extends StatefulWidget {
  const SearchScreenBody({Key? key}) : super(key: key);

  @override
  _SearchScreenBodyState createState() => _SearchScreenBodyState();
}

class _SearchScreenBodyState extends State<SearchScreenBody> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  String url = 'this is url';
  String searchText = '';
  bool ispressed = false;
  final SearchRepository _searchRepository = SearchRepository();
  late Future<List<Food>> futureFoodList;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 20),
            child: SizedBox(
              width: size.width * 0.80,
              child: CustomTextField(
                  size: size,
                  onPress: (val) {
                    searchText = val;
                    ispressed = true;
                    setState(() {});
                  },
                  icon: Icons.search,
                  textHint: 'search'),
            ),
          ),
          (searchText.isNotEmpty && ispressed)
              ? Expanded(
                  child: FutureBuilder<List<Food>>(
                    future: _searchRepository.searchFood(searchText),
                    builder: (_, snapshot) {
                      if (snapshot.data != null && snapshot.data!.isNotEmpty) {
                        return Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, int index) {
                                  var food = snapshot.data![index];

                                  return Text(food.name!);
                                },
                              ),
                            ),
                          ],
                        );
                      }
                      return const Center(child: Text('No snapshot found'));
                    },
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  StreamBuilder<QuerySnapshot<Map<String, dynamic>>> searchListBuilder() {
    return StreamBuilder(
        stream: _firebaseFirestore.collection('Foods').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.data != null) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, int index) {
                      var doc = snapshot.data!.docs[index];
                      var catList = doc['category'];
                      for (var category in catList) {
                        if (category == searchText) {
                          return SizedBox(
                            width: 50,
                            height: 50,
                            child: Text(doc['name']),
                          );
                        }
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ],
            );
          }
          return const Center(child: Text('No snapshot found'));
        });
  }
}
