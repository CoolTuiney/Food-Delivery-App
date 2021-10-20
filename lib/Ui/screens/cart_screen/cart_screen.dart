import 'package:flutter/material.dart';

import 'cart_screen_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CartScreenBody(),
    );
  }
}
