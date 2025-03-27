import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../admin/category_dialog/models/category.dart';

class CoffeeChipSelectorStyle2 extends StatelessWidget {
  final List<CategoryDto> options;
  final String? selectedId;
  final void Function(CategoryDto item) onSelected;

  const CoffeeChipSelectorStyle2({
    super.key,
    required this.options,
    this.selectedId,
    required this.onSelected,
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
                  child: Text(
                    option.title,
                    style: TextStyle(
                      color:
                          isSelected ? Colors.white : const Color(0xff4E3118),
                      fontWeight: FontWeight.bold,
                    ),
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
