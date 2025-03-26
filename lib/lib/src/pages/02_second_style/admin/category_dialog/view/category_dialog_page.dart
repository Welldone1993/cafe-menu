import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/category_dialog_controller.dart';
import 'icons.dart';

class CategoryFormDialog extends GetView<CategoryController> {
  const CategoryFormDialog({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: SizedBox(
          width: 600,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "دسته بندی منو",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: controller.titleController,
                        decoration: InputDecoration(
                          labelText: "عنوان دسته بندی",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) => value!.isEmpty
                            ? 'وارد کردن عنوان دسته بندی الزامی است'
                            : null,
                      ),
                      const SizedBox(height: 16),
                      IconDropdown(),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          if (controller.formKey.currentState!.validate()) {
                            controller.item != null
                                ? controller.editCategory()
                                : controller.addCategory();
                          }
                        },
                        child: const Text("تایید"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
