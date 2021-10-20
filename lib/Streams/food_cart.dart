import 'dart:async';
import '../Models/food_model.dart';
import '../services/firebase_auth.dart';

enum CartAction { fetch, delete, increment, decrement }

class CartBloc {
  final _stateStreamController = StreamController<List<Food>>();
  final _eventStreamController = StreamController<CartAction>();
  StreamSink<List<Food>> get _cartSink => _stateStreamController.sink;
  Stream<List<Food>> get cartStream => _stateStreamController.stream;
  StreamSink<CartAction> get eventSink => _eventStreamController.sink;
  Stream<CartAction> get _eventStream => _eventStreamController.stream;

  final FirebaseService _firebaseService = FirebaseService();

  CartBloc() {
    _eventStream.listen((event) async {
      if (event == CartAction.fetch) {
        try {
          var foodList = await _addFood();
          _cartSink.add(foodList);
        } catch (e) {
          _cartSink.addError('something went wrong');
        }
      }
    });
  }

  Future<List<Food>> _addFood() async {
    var cartList = await _firebaseService.getCart();
    var foodListFromDB = await _firebaseService.getFood();
    List<Food> foodList = [];

    for (var cartFood in cartList) {
      for (var food in foodListFromDB) {
        if (cartFood['foodId'] == food.name) {
          foodList.add(food);
        }
      }
    }

    return foodList;
  }
}
