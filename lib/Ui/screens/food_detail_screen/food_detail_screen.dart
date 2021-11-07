import 'package:flutter/material.dart';
import 'package:food_delivery_app/Models/food_model.dart';
import 'package:food_delivery_app/provider/quantity_provider.dart';
import 'package:provider/provider.dart';

import 'food_detail_body.dart';

class FoodDetailScreen extends StatelessWidget {
  final Food food;
  final String tag;
  const FoodDetailScreen({
    Key? key,
    required this.food,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => QuantityProvider(),
        child: FoodDetailBody(
          tag: tag,
          food: food,
        ),
      ),
    );
  }
}
