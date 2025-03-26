import 'package:appwrite/appwrite.dart' as appwrite;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../../infrastructure/app_writer.dart';
import '../models/category.dart';

class CategoryController extends GetxController {
  CategoryController({
    this.item,
    required this.isEdit,
  });

  final titleController = TextEditingController();
  final RxBool isLogin = true.obs;
  final RxBool rememberMe = false.obs;
  final RxBool isEdit;
  final formKey = GlobalKey<FormState>();
  Rxn<IconData> selectedIcon = Rxn();
  final CategoryDto? item;

  @override
  void onInit() {
    if (item != null) {
      titleController.text = item!.title;
      selectedIcon.value = item!.icon;
    }
    super.onInit();
  }

  void addCategory() {
    addNewCategory(CategoryDto(
        title: titleController.text.trim(), id: '', icon: selectedIcon.value));
  }

  Future<void> addNewCategory(CategoryDto category) async {
    try {
      await appwriteService.databases.createDocument(
        databaseId: appwriteService.databaseId,
        collectionId: appwriteService.collectionCategoryId,
        documentId: appwrite.ID.unique(),
        data: category.toJson(),
      );
      Get.back<bool>(result: true);
      showSuccesSnackBar('ثبت شد');
    } catch (e) {
      showFaildSnackBar(e.toString());
    }
  }

  void editCategory() {
    if (item == null) {
      showFaildSnackBar('آیتم موردنظر یافت نشد');
      return;
    }

    editNewCategory(CategoryDto(
      title: titleController.text.trim(),
      id: item!.id,
      icon: selectedIcon.value,
    ));
  }

  Future<void> editNewCategory(CategoryDto category) async {
    try {
      await appwriteService.databases.updateDocument(
        databaseId: appwriteService.databaseId,
        collectionId: appwriteService.collectionCategoryId,
        documentId: category.id, // 👈 مقدار ID اینجا باید صحیح باشد
        data: category.toJson(),
      );

      Get.back<bool>(result: true);
      showSuccesSnackBar('ویرایش شد');
    } catch (e) {
      showFaildSnackBar(e.toString());
    }
  }

  void showSuccesSnackBar(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void showFaildSnackBar(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  final List<IconData> cafeIcons = [
    Icons.local_cafe,
    Icons.free_breakfast,
    Icons.emoji_food_beverage,
    Icons.cake, // Dessert
    Icons.local_dining, // Dining
    Icons.fastfood, // Fast food
    Icons.local_drink, // Mashrubat dige
    Icons.restaurant, // Restaurant
    Icons.lunch_dining, // Ghaza-ye roozane
    Icons.bakery_dining, // Bakery
    Icons.set_meal, // Meal
    Icons.icecream, // Ice cream
    Icons.local_bar, // Bar ya lounge
    Icons.wine_bar, // Wine bar
    Icons.soup_kitchen, // Soup kitchen
    Icons.local_pizza,
  ];
}
