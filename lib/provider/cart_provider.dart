import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/Models/cart_model.dart';
import 'package:food_delivery_app/repository/cart_repository.dart';

class CartProvider extends ChangeNotifier {
  final CartRepository _cartRepository = CartRepository();
  Stream<List<Cart>> get getCart {
    _cartRepository.getCart();
    return _cartRepository.stream;
  }
}
