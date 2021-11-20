import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {
  Future<bool> checkPermission() async {
    final serviceStatus = await Permission.locationWhenInUse.serviceStatus;
    bool isGpsOn = serviceStatus == ServiceStatus.enabled;
    if (!isGpsOn) {
      debugPrint('Turn on location services before requesting permission.');
    }
    final status = await Permission.locationWhenInUse.request();
    if (status == PermissionStatus.granted) {
      debugPrint('Permission granted');
      return true;
    } else if (status == PermissionStatus.denied) {
      debugPrint(
          'Denied. Show a dialog with a reason and again ask for the permission.');
      return false;
    } else if (status == PermissionStatus.permanentlyDenied) {
      debugPrint('Take the user to the settings page.');
      
      return false;
    } else {
      return false;
    }
  }
}
