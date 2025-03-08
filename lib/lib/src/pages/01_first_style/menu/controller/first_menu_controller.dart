import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/category_view_model.dart';

class FirstMenuController {
  final TextEditingController searchTextController = TextEditingController();

  final RxInt selectedCategory = 1.obs;

  final List<CategoryViewModel> coffeeOptions = [
    CategoryViewModel(id: 1, icon: Icons.coffee, name: "کاپوچینو"),
    // Cappuccino
    CategoryViewModel(id: 2, icon: Icons.coffee_maker, name: "اسپرسو"),
    // Espresso
    CategoryViewModel(id: 3, icon: Icons.local_cafe, name: "آمریکانو"),
    // Americano
    CategoryViewModel(id: 4, icon: Icons.emoji_food_beverage, name: "لاته"),
    // Latte
    CategoryViewModel(id: 5, icon: Icons.icecream, name: "آیس کافی"),
    // Iced Coffee
  ];
}
