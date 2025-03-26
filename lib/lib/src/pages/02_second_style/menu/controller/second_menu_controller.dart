import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../admin/category_dialog/models/category.dart';
import '../model/category_item_view_model.dart';
import '../repository/second_menu_repository.dart';

class SecondMenuController extends GetxController {
  final TextEditingController searchTextController = TextEditingController();

  final Rxn<CategoryDto> selectedCategory = Rxn();
  final Rx<List<CategoryItemViewModel>> selectedCategoryItems = Rx([]);

  final List<CategoryDto> coffeeOptions = [];
  final SecondMenuPageRepository _repository = SecondMenuPageRepository();

  final RxBool isDataFetched = false.obs, isItemsFetched = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
/*    await getCategories();
    await getItems(1);*/
  }

/*  Future<void> getCategories() async {
    isDataFetched.value = false;

    final List<CategoryDto> result = await _repository.getCategories();
    coffeeOptions.addAll(result);
    selectedCategory.value = coffeeOptions.first;
    isDataFetched.value = true;
  }

  Future<void> getItems(final int id) async {
    isItemsFetched.value = false;
    selectedCategoryItems.value.clear();
    final List<CategoryItemViewModel> result = await _repository.getItems(id);

    selectedCategoryItems.value.addAll(result);
    isItemsFetched.value = true;
  }*/
}
