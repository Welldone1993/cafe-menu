import 'package:cafe_menu_temp/lib/src/pages/02_second_style/admin/item_dialog/view/widget/show_admin_category_chip_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/item_dialog_controller.dart';

class ItemFormDialog extends GetView<ItemController> {
  const ItemFormDialog({super.key});

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
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "ایتم منو",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: controller.titleController,
                          decoration: InputDecoration(
                            labelText: "عنوان",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) => value!.isEmpty
                              ? 'وارد کردن عنوان الزامی است'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: controller.descriptionController,
                          decoration: InputDecoration(
                            labelText: "توضیحات",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) => value!.isEmpty
                              ? 'وارد کردن توضیحات الزامی است'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: controller.priceController,
                          decoration: InputDecoration(
                            labelText: "قیمت",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextButton(
                            onPressed: () => controller.pickImageFromGallery(),
                            child: Text('انتخاب عکس')),
                        TextButton(
                            onPressed: () =>
                                controller.imageBytesForSave.value = null,
                            child: Text('خذف عکس')),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Obx(
                              () => controller.imageBytesForSave.value != null
                                  ? Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(16.0),
                                        decoration: _containerDecoration(),
                                        child: Image.memory(
                                          controller.imageBytesForSave.value!,
                                          height: 200,
                                          width: 200,
                                          fit: BoxFit.contain,
                                          errorBuilder: (context, error,
                                                  stackTrace) =>
                                              const Icon(Icons.error, size: 50),
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                        Obx(() => controller.isChipLoading.value
                            ? CircularProgressIndicator()
                            : ShowAdminCoffeeChipSelectorStyle2(
                                onSelected: (value) {
                                  controller.selectedCategory.value = value;
                                },
                                options:
                                    controller.coffeeOptions.reversed.toList(),
                                selectedId:
                                    controller.selectedCategory.value?.id,
                              )),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.item != null
                                  ? controller.editItem()
                                  : controller.addItem();
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
        ),
      );

  BoxDecoration _containerDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha((0.1 * 255).toInt()),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}
