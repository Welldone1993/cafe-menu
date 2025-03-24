import 'package:flutter/cupertino.dart';

class CategoryViewModel {
  final int id;
  final IconData? icon;
  final String name;

  CategoryViewModel({
    required this.id,
    this.icon,
    required this.name,
  });
}
