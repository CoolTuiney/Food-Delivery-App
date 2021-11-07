import 'dart:async';
import 'package:food_delivery_app/Models/cart_model.dart';
import 'package:food_delivery_app/services/firebase_service.dart';

class CartRepository {
  final FirebaseService _firebaseService = FirebaseService();
  StreamController<List<Cart>> controller = StreamController<List<Cart>>();
  Stream<List<Cart>> get stream => controller.stream;

  void getCart() async {
    var snapshotStream = await _firebaseService.getCart();
    snapshotStream.listen((event) async {
      List<Cart> cartList = [];
      for (var doc in event.docs) {
        var foodId = doc['food_id'];
        var quantity = doc['quantity'];
        var food = await _firebaseService.searchFoodItemById(foodId);
        Cart cart = Cart(
            name: food.name,
            discount: food.discount,
            photoUrl: food.photoUrl,
            discription: food.discription,
            price: food.price,
            category: food.category,
            quantity: quantity);
        cartList.add(cart);
      }
      controller.sink.add(cartList);
    });
  }

  void addItemToCart(String foodName, int quantity) =>
      _firebaseService.addItemToCart(foodName, quantity);
      
  void removeItemFromCart(String cartItemName) =>
      _firebaseService.removeItemFromCart(cartItemName);

  void incrementCart(String name, int quantity) {
    if (quantity <= 10) {
      _firebaseService.updateQuantityOfCartItem(name, quantity + 1);
    }
  }

  void decrementCart(String name, int quantity) {
    if (quantity > 1) {
      _firebaseService.updateQuantityOfCartItem(name, quantity - 1);
    }
  }
}
