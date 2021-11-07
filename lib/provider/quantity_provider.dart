import 'package:flutter/cupertino.dart';


class QuantityProvider extends ChangeNotifier {
  int quantity = 1;
  int get getQuantity => quantity;
  
  void incrementQuantity() {
    quantity++;
    notifyListeners();
  }

  void decrementQuantity() {
    quantity--;
    notifyListeners();
  }
}
