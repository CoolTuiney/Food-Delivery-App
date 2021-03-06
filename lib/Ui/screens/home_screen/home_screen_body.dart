import 'package:flutter/material.dart';
import '../../widgets/custom_background.dart';
import 'components/category.dart';
import 'components/food_list.dart';
import 'components/home_screen_appbar.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody>
    with AutomaticKeepAliveClientMixin {
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
    super.build(context);
    return Column(children: [
      CustomBackground(
        size: size,
        widget: HomeScreenAppBar(
          size: size,
          con: context,
        ),
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
    ]);
  }

  @override
  bool get wantKeepAlive => true;
}
