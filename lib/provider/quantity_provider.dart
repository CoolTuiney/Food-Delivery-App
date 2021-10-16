import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  // ignore: prefer_final_fields
  int _count = 1;

  int get getCount => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    if (_count > 1) {
      _count--;
      notifyListeners();
    }
  }
}
