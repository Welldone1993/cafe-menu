import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/category_item_view_model.dart';
import '../model/category_view_model.dart';

class FirstMenuController extends GetxController {
  final TextEditingController searchTextController = TextEditingController();

  final Rxn<CategoryViewModel> selectedCategory = Rxn();

  final List<CategoryViewModel> coffeeOptions = [];

  @override
  void onInit() {
    super.onInit();
    coffeeOptions.addAll([
      CategoryViewModel(id: 1, icon: Icons.coffee, name: "قهوه داغ", items: [
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
      ]),
      CategoryViewModel(
          id: 2,
          icon: Icons.coffee_maker,
          name: "قهوه سرد",
          items: [
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
          ]),
      CategoryViewModel(
          id: 3,
          icon: Icons.local_cafe,
          name: "نوشیدنی‌های خاص",
          items: [
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
          ]),
    ]);
    selectedCategory.value = coffeeOptions.first;
  }
}
