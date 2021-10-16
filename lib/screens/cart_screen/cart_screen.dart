import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/cart_screen/cart_screen_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CartScreenBody(),
    );
  }
}
