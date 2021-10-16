import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/custom_background.dart';
import 'package:food_delivery_app/screens/home_screen/components/category.dart';
import 'package:food_delivery_app/screens/home_screen/components/food_list.dart';
import 'package:food_delivery_app/screens/home_screen/components/home_screen_appbar.dart';
import 'package:food_delivery_app/widgets/bottom_navigation/bot_nav_bar.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    List<String> categories = [
      'All',
      'Indian',
      'American',
      'Chicken',
      'Spicy',
      'All',
      'Indian',
      'American',
      'Chicken',
      'Spicy',
    ];
    return Column(children: [
      CustomBackground(
        size: size,
        widget: HomeScreenAppBar(size: size),
      ),
      Categories(size: size, categories: categories),
      Expanded(
        flex: 9,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                FoodList(
                  size: size,
                  title: "Today's best deals",
                ),
                FoodList(size: size, title: "Top offers for you"),
                FoodList(
                  size: size,
                  title: "Continental Special",
                ),
              ],
            ),
          ),
        ),
      ),
      Expanded(child: CustomBottomNavigationBar(size: size)),
    ]);
  }
}
