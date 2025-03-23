import 'package:flutter/cupertino.dart';

import 'category_item_view_model.dart';

class CategoryViewModel {
  final int id;
  final IconData? icon;
  final String name;
  final List<CategoryItemViewModel> items;

  CategoryViewModel({
    required this.id,
    this.icon,
    required this.name,
    this.items = const [],
  });
}
