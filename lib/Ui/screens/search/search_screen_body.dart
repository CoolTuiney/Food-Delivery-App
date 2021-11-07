import 'package:flutter/material.dart';
import 'package:food_delivery_app/Models/food_model.dart';
import 'package:food_delivery_app/Ui/screens/custom_background.dart';
import 'package:food_delivery_app/Ui/screens/food_detail_screen/food_detail_screen.dart';
import 'package:food_delivery_app/Ui/widgets/custom_text_field.dart';
import 'package:food_delivery_app/repository/search_repository.dart';
import 'dart:math';

class SearchScreenBody extends StatefulWidget {
  const SearchScreenBody({Key? key}) : super(key: key);

  @override
  _SearchScreenBodyState createState() => _SearchScreenBodyState();
}

class _SearchScreenBodyState extends State<SearchScreenBody> {
  String url = 'this is url';
  String searchText = '';
  bool isSearch = false;
  final SearchRepository _searchRepository = SearchRepository();
  late Future<List<Food>> futureFoodList;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        CustomBackground(
          size: size,
          widget: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: size.width * 0.80,
              child: CustomTextField(
                  size: size,
                  color: Colors.white,
                  onPress: (val) {
                    searchText = val;
                    isSearch = true;
                    setState(() {});
                  },
                  icon: Icons.search,
                  textHint: 'search'),
            ),
          ),
        ),
        (searchText.isNotEmpty && isSearch)
            ? Expanded(
                child: searchListFood(),
              )
            : const SizedBox(),
      ],
    );
  }

  FutureBuilder<List<Food>> searchListFood() {
    return FutureBuilder<List<Food>>(
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

                    return listOfTResult(food);
                  },
                ),
              ),
            ],
          );
        }
        return const Center(child: Text('No snapshot found'));
      },
    );
  }

  Widget listOfTResult(Food food) {
    final discountPrice = food.price! - (food.price! * (food.discount! / 100));
    final Random random = Random();
    final tag = food.name! + random.nextInt(1000).toString();
    return Hero(
      tag: tag,
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => FoodDetailScreen(food: food, tag: tag))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.network('${food.photoUrl}',
                            fit: BoxFit.fill)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${food.name}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.access_time_outlined,
                              size: 23,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '35-45 mins',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            VerticalDivider(
                              thickness: 1,
                              indent: 3,
                              endIndent: 3,
                              color: Colors.black,
                            ),
                            Icon(
                              Icons.star_border,
                              size: 23,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '4.2',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '₹ $discountPrice',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 2,
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
