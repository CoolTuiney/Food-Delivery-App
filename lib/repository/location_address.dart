import 'package:flutter/material.dart';
import 'package:food_delivery_app/Models/address_model.dart';
import 'package:food_delivery_app/repository/permission_handler.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationRepository {
  Future<Position?> getGeoLocationPosition() async {
    PermissionHandler permissionHandler = PermissionHandler();
    bool isGranted = await permissionHandler.checkPermission();
    if (isGranted) {
      return Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } else {
      return null;
    }
  }

  Future<Address?> getAddressFromLonAndLat() async {
    Address address;
    Position? position = await getGeoLocationPosition();
    if (position != null) {
      List<Placemark> placemark =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemark[3];
      debugPrint('$placemark');
      address = Address.fromPlacemark(place);
      return address;
    } else {
      return null;
    }
  }
}
