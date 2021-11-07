import 'package:food_delivery_app/Models/food_model.dart';
import 'package:food_delivery_app/services/firebase_service.dart';

class SearchRepository {
  final FirebaseService _firebaseService = FirebaseService();

  Future<List<Food>> searchFood(String name) async {

    List<Food> resultedList = [];
    var foodList = await _firebaseService.getFood();
    for (Food food in foodList) {
      String search = name.toLowerCase();
      String foodName = food.name!.toLowerCase();
      if (foodName.contains(search)) {
        resultedList.add(food);
      }
    }
    return resultedList;
  }
}
