import 'package:cafe_menu_temp/lib/src/pages/02_second_style/admin/category_dialog/models/category.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../../infrastructure/app_writer.dart';
import '../../category_dialog/controller/category_dialog_controller.dart';
import '../../category_dialog/view/category_dialog_page.dart';

class AdminController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  final RxBool isLogin = true.obs;
  final RxBool isLoading = false.obs;
  final RxBool isPasswordVisible = false.obs;
  final formKey = GlobalKey<FormState>();
  final List<CategoryDto> coffeeOptions = [];
  final Rxn<CategoryDto> selectedCategory = Rxn();

  @override
  Future<void> onInit() async {
    await addCategory();
    super.onInit();
  }

  Future<void> addCategory() async {
    coffeeOptions.clear();
    final data = await fetchCategory();
    coffeeOptions.addAll(data);
  }

  Future<List<CategoryDto>> fetchCategory() async {
    isLoading(true);
    final response = await appwriteService.databases.listDocuments(
      databaseId: appwriteService.databaseId,
      collectionId: appwriteService.collectionCategoryId,
    );
    isLoading(false);
    return response.documents
        .map((doc) => CategoryDto.fromJson(doc.data))
        .toList();
  }

  Future<void> showAddCategoryDialog(BuildContext context) async {
    Get.put(CategoryController(isEdit: false.obs));
    final bool? result = await showDialog(
      context: context,
      builder: (BuildContext context) => CategoryFormDialog(),
    );
    Get.delete<CategoryController>();
    if (result != null && result) {
      await addCategory();
    }
  }

  Future<void> showEditCategoryDialog({
    required BuildContext context,
    required CategoryDto item,
  }) async {
    Get.put(CategoryController(
      isEdit: true.obs,
      item: item,
    ));
    final bool? result = await showDialog(
      context: context,
      builder: (BuildContext context) => CategoryFormDialog(),
    );
    Get.delete<CategoryController>();
    if (result != null && result) {
      await addCategory();
    }
  }

  Future<void> showDeleteCategoryDialog({
    required BuildContext context,
    required String id,
  }) async {
    final bool result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('حذف یک مورد'),
          content: const Text('آیا مطمئن هستید که می خواهید حذف کنید؟'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('لغو'),
            ),
            TextButton(
              onPressed: () async {
                await deleteCategory(id);

                if (!context.mounted) return;

                _showSuccesSnackBar("مورد انتخابی حذف شد");
                Get.back(result: true);
              },
              child: const Text('حذف'),
            ),
          ],
        );
      },
    );
    if (result) {
      await addCategory();
    }
  }

  Future<void> deleteCategory(String documentId) async {
    await appwriteService.databases.deleteDocument(
      databaseId: appwriteService.databaseId,
      collectionId: appwriteService.collectionCategoryId,
      documentId: documentId,
    );
  }

  void _showSuccesSnackBar(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _showFaildSnackBar(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
