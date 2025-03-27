import 'package:appwrite/appwrite.dart' as appwrite;
import 'package:cafe_menu_temp/lib/src/pages/02_second_style/admin/item_dialog/models/item_dto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructure/app_writer.dart';
import '../../admin/category_dialog/models/category.dart';
import '../repository/second_menu_repository.dart';

class SecondMenuController extends GetxController {
  final TextEditingController searchTextController = TextEditingController();

  final Rxn<CategoryDto> selectedCategory = Rxn();
  final Rx<List<ItemDto>> selectedCategoryItems = Rx([]);
  final RxBool isChipLoading = true.obs;
  final List<CategoryDto> coffeeOptions = [];
  final SecondMenuPageRepository _repository = SecondMenuPageRepository();
  final RxBool isItemLoading = false.obs;
  final RxBool isDataFetched = false.obs, isItemsFetched = false.obs;

  @override
  Future<void> onInit() async {
    await updateCategory();
    await updateItem();
    super.onInit();
  }

  Future<void> updateCategory() async {
    coffeeOptions.clear();
    final data = await fetchCategory();
    coffeeOptions.add(CategoryDto(title: 'همه', id: '0'));
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

  Future<void> updateItem() async {
    selectedCategoryItems.value.clear();
    final data = await fetchItem();
    selectedCategoryItems.value.addAll(data);
  }

  Future<List<ItemDto>> fetchItem() async {
    isItemLoading(true);
    final response = await appwriteService.databases.listDocuments(
      databaseId: appwriteService.databaseId,
      collectionId: appwriteService.collectionItemId,
    );
    isItemLoading(false);
    return response.documents.map((doc) => ItemDto.fromJson(doc.data)).toList();
  }

  Future<void> updateItemByCategoryId(
      {required final String categoryId}) async {
    if (categoryId != '0') {
      selectedCategoryItems.value.clear();
      final data = await fetchItemByCategoryId(categoryId: categoryId);
      selectedCategoryItems.value.addAll(data);
    } else {
      updateItem();
    }
  }

  Future<List<ItemDto>> fetchItemByCategoryId(
      {required final String categoryId}) async {
    isItemLoading(true);
    final response = await appwriteService.databases.listDocuments(
      databaseId: appwriteService.databaseId,
      collectionId: appwriteService.collectionItemId,
      queries: [appwrite.Query.equal('categoryId', categoryId)],
    );
    isItemLoading(false);
    return response.documents.map((doc) => ItemDto.fromJson(doc.data)).toList();
  }
}
