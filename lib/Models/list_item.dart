import 'package:flutter/material.dart';

class ListItem {
  String title;
  IconData icon;
  VoidCallback onTap;
  ListItem({required this.title, required this.icon, required this.onTap});
}
