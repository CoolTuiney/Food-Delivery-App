import 'dart:async';
import '../Models/food_model.dart';
import '../services/firebase_auth.dart';

enum FoodAction { fetch, delete }

class FoodBloc {
  final FirebaseService _firebaseService = FirebaseService();
  final _stateStreamController = StreamController<List<Food>>();
  StreamSink<List<Food>> get _foodSink => _stateStreamController.sink;
  Stream<List<Food>> get foodStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<FoodAction>();
  StreamSink<FoodAction> get eventSink => _eventStreamController.sink;
  Stream<FoodAction> get _eventStream => _eventStreamController.stream;

  FoodBloc() {
    _eventStream.listen((event) async {
      if (event == FoodAction.fetch) {
        var foodList = await _firebaseService.getFood();
        _foodSink.add(foodList);
      }
    });
  }
}
