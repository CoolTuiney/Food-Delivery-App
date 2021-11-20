import 'package:food_delivery_app/Models/food_model.dart';
import 'package:food_delivery_app/services/firebase_service.dart';

class WishlistRepository {
  final FirebaseService _firebaseService = FirebaseService();
  void addItemToWishList(String name) => _firebaseService.addToWhishList(name);
  void removeItemFromWishList(String name) =>
      _firebaseService.removeFromWhishList(name);
  Future<bool> checkItemInWishlist(String name) async {
    bool isExist = await _firebaseService.checkWishlist(name);
    return isExist;
  }

  Future<Stream> getWishlist() async => _firebaseService.getWishlist();
  Future<Food> searchItem(String name) async =>
      await _firebaseService.searchFoodItemById(name);
}
