import 'dart:typed_data';

import 'package:appwrite/appwrite.dart' as appwrite;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../infrastructure/app_writer.dart';
import '../../category_dialog/models/category.dart';
import '../models/item_dto.dart';

class ItemController extends GetxController {
  ItemController({
    this.item,
  });

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final RxBool isLoading = true.obs;
  final RxBool isChipLoading = true.obs;
  final RxBool rememberMe = false.obs;

  final formKey = GlobalKey<FormState>();
  Rxn<IconData> selectedIcon = Rxn();
  final ItemDto? item;
  Rxn<Uint8List> imageBytesForSave = Rxn();
  String? imageUrl;
  String? fileId;
  final List<CategoryDto> coffeeOptions = [];
  final Rxn<CategoryDto> selectedCategory = Rxn();

  @override
  Future<void> onInit() async {
    //await updateCategory();
    if (item != null) {
      titleController.text = item!.title;
      // selectedIcon.value = item!.icon;
    }
    super.onInit();
  }

  Future<void> updateCategory() async {
    coffeeOptions.clear();
    final data = await fetchCategory();
    coffeeOptions.addAll(data);
  }

  Future<List<CategoryDto>> fetchCategory() async {
    isChipLoading(true);
    final response = await appwriteService.databases.listDocuments(
      databaseId: appwriteService.databaseId,
      collectionId: appwriteService.collectionCategoryId,
    );
    isChipLoading(false);
    return response.documents
        .map((doc) => CategoryDto.fromJson(doc.data))
        .toList();
  }

  void addItem() {
    addNewItem(ItemDto(
      title: titleController.text.trim(),
      id: '',
      description: descriptionController.text.trim(),
      categoryId: selectedCategory.value?.id,
      fileId: fileId,
      imageUrl: imageUrl,
      price: double.tryParse(priceController.text.trim()),
      rating: 0,
    ));
  }

  Future<void> addNewItem(ItemDto category) async {
    try {
      await appwriteService.databases.createDocument(
        databaseId: appwriteService.databaseId,
        collectionId: appwriteService.collectionItemId,
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

    editNewCategory(ItemDto(
      title: titleController.text.trim(),
      id: item!.id,
      description: '',
      categoryId: '',
      fileId: '',
      imageUrl: '',
      price: 0,
      rating: 0,
    ));
  }

  Future<void> editNewCategory(ItemDto category) async {
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

  Future<void> pickImageFromGallery() async {
    isLoading.value = true;
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        final bytes = await pickedImage.readAsBytes();
        imageBytesForSave.value = bytes;

        if (imageBytesForSave.value != null) {
          fileId = await uploadQrImage(imageBytesForSave.value!);
          if (fileId != null) {
            imageUrl = getQrImageUrl(fileId!);
          }
        }
      } else {
        showFaildSnackBar('تصویری انتخاب نشد.');
      }
    } catch (e) {
      showFaildSnackBar('خطا در انتخاب تصویر: $e');
    }
    isLoading.value = false;
  }

  Future<String?> uploadQrImage(Uint8List bytes) async {
    try {
      final user = await appwriteService.account.get();

      final response = await appwriteService.storage.createFile(
        bucketId: appwriteService.bucketId,
        fileId: appwrite.ID.unique(),
        file: appwrite.InputFile.fromBytes(
          bytes: bytes,
          filename: 'item${DateTime.now().millisecondsSinceEpoch}.png',
        ),
        permissions: [
          appwrite.Permission.read('user:${user.$id}'),
          appwrite.Permission.delete('user:${user.$id}'),
          appwrite.Permission.update('user:${user.$id}'),
        ],
      );

      return response.$id;
    } catch (e) {
      print("Error uploading file: $e");
      return null;
    }
  }

  String getQrImageUrl(String fileId) {
    return "https://cloud.appwrite.io/v1/storage/buckets/67e3be28001c5fbed3a5/files/$fileId/view?project=67d67588002156ea6599";
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
