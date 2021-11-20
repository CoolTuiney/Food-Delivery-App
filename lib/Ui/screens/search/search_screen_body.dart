import 'package:flutter/material.dart';
import 'package:food_delivery_app/Models/food_model.dart';
import 'package:food_delivery_app/Ui/screens/custom_background.dart';
import 'package:food_delivery_app/Ui/screens/search/components/list_of_food.dart';
import 'package:food_delivery_app/Ui/widgets/custom_text_field.dart';
import 'package:food_delivery_app/repository/search_repository.dart';

class SearchScreenBody extends StatefulWidget {
  const SearchScreenBody({Key? key}) : super(key: key);

  @override
  _SearchScreenBodyState createState() => _SearchScreenBodyState();
}

class _SearchScreenBodyState extends State<SearchScreenBody>
    with AutomaticKeepAliveClientMixin {
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
    super.build(context);
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

                    return ListOfFood(context: context, food: food);
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

  @override
  bool get wantKeepAlive => true;
}
