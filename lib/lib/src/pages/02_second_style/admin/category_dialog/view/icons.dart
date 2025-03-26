import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/category_dialog_controller.dart';

class IconDropdown extends GetView<CategoryController> {
  const IconDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DropdownButtonFormField<IconData>(
        decoration: const InputDecoration(
          labelText: "یک آیکن انتخاب کنید",
          border: OutlineInputBorder(),
        ),
        value: controller.selectedIcon.value,
        items: controller.cafeIcons.map((icon) {
          return DropdownMenuItem(
            value: icon,
            child: Row(
              children: [
                Icon(icon),
                const SizedBox(width: 8),
                // Text(icon.codePoint.toString()),
              ],
            ),
          );
        }).toList(),
        onChanged: (newValue) {
          controller.selectedIcon.value = newValue;
        },
      );
    });
  }
}
