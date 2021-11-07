import 'package:flutter/material.dart';
import 'package:food_delivery_app/Models/cart_model.dart';
import 'package:food_delivery_app/provider/cart_provider.dart';
import 'package:provider/provider.dart';

import 'cart_screen_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamProvider<List<Cart>>.value(
          value: CartProvider().getCart,
          initialData: const [],
          child: const CartScreenBody()),
    );
  }
}
