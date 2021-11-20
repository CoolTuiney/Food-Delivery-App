import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/Models/address_model.dart';
import 'package:food_delivery_app/repository/location_address.dart';

class LocationProvider extends ChangeNotifier {
  final LocationRepository _locationRepository = LocationRepository();
  Address? _address;

  Address? get getAddress => _address;

  Future<Address?> getCurrentLocation() async {
    Address? address = await _locationRepository.getAddressFromLonAndLat();
    _address = address;
    notifyListeners();
    return address;
  }
}
