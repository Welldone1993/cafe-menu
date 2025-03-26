import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../category_dialog/models/category.dart';

class AdminCoffeeChipSelectorStyle2 extends StatelessWidget {
  final List<CategoryDto> options;
  final String? selectedId;
  final void Function(CategoryDto item) onSelected;
  final void Function(CategoryDto item) onDelete;
  final void Function(CategoryDto item) onEdit;

  const AdminCoffeeChipSelectorStyle2({
    super.key,
    required this.options,
    this.selectedId,
    required this.onSelected,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) => ScrollConfiguration(
        behavior: _scrollBehavior(context),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          reverse: true,
          child: Row(
            children: options.map((option) {
              final bool isSelected = selectedId == option.id;
              return GestureDetector(
                onTap: () => onSelected(option),
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xffc67c4e) : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Text(
                        option.title,
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : const Color(0xff4E3118),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        constraints:
                            BoxConstraints(maxHeight: 25, maxWidth: 25),
                        onPressed: () => onDelete(option),
                        icon: Icon(
                          Icons.delete,
                          size: 14,
                        ),
                      ),
                      IconButton(
                        constraints:
                            BoxConstraints(maxHeight: 25, maxWidth: 25),
                        onPressed: () => onEdit(option),
                        icon: Icon(
                          Icons.edit,
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );

  ScrollBehavior _scrollBehavior(BuildContext context) =>
      ScrollConfiguration.of(context).copyWith(dragDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      });
}
