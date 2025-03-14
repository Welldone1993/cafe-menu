import 'package:flutter/material.dart';

import '../model/category_item_view_model.dart';
import '../model/category_view_model.dart';

class FirstMenuPageRepository {
  Future<List<CategoryViewModel>> getCategories() async {
    return _categories;
  }

  Future<List<CategoryItemViewModel>> getItems(final int id) async {
    return _items[id] ?? [];
  }

  final List<CategoryViewModel> _categories = [
    CategoryViewModel(
      id: 1,
      icon: Icons.coffee,
      name: "قهوه داغ",
    ),
    CategoryViewModel(
      id: 2,
      icon: Icons.coffee_maker,
      name: "قهوه سرد",
    ),
    CategoryViewModel(
      id: 3,
      icon: Icons.local_cafe,
      name: "نوشیدنی‌های خاص",
    )
  ];

  final Map<int, List<CategoryItemViewModel>> _items = {
    1: [
      CategoryItemViewModel(
        imageUrl: "assets/cappuccino.jpg",
        title: "کاپوچینو",
        description: "با شکلات",
        price: 5.12,
        rating: 4.7,
      ),
      CategoryItemViewModel(
        imageUrl: "assets/espresso.jpg",
        title: "اسپرسو",
        description: "قهوه تلخ",
        price: 3.99,
        rating: 4.5,
      ),
      CategoryItemViewModel(
        imageUrl: "assets/iced_coffee.jpg",
        title: "آیس کافی",
        description: "با شیر و یخ",
        price: 4.99,
        rating: 4.3,
      ),
    ],
    2: [
      CategoryItemViewModel(
        imageUrl: "assets/iced_coffee.jpg",
        title: "آیس کافی",
        description: "با شیر و یخ",
        price: 4.99,
        rating: 4.3,
      ),
      CategoryItemViewModel(
        imageUrl: "assets/cold_brew.jpg",
        title: "کولد برو",
        description: "قهوه سرد دم",
        price: 4.59,
        rating: 4.6,
      ),
      CategoryItemViewModel(
        imageUrl: "assets/espresso.jpg",
        title: "اسپرسو",
        description: "قهوه تلخ",
        price: 3.99,
        rating: 4.5,
      ),
    ],
    3: [
      CategoryItemViewModel(
        imageUrl: "assets/mocha.jpg",
        title: "موکا",
        description: "قهوه شکلاتی",
        price: 5.49,
        rating: 4.8,
      ),
      CategoryItemViewModel(
        imageUrl: "assets/latte.jpg",
        title: "لاته",
        description: "نرم و خامه‌ای",
        price: 4.79,
        rating: 4.7,
      ),
    ],
  };
}
