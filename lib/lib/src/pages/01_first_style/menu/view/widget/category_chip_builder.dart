import 'package:flutter/material.dart';

import '../../model/category_view_model.dart';

class CoffeeChipSelector extends StatefulWidget {
  final List<CategoryViewModel> options;
  final int? selectedId;
  final void Function(CategoryViewModel item) onSelected;

  const CoffeeChipSelector({
    super.key,
    required this.options,
    required this.selectedId,
    required this.onSelected,
  });

  @override
  CoffeeChipSelectorState createState() => CoffeeChipSelectorState();
}

class CoffeeChipSelectorState extends State<CoffeeChipSelector> {
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.options.map((option) {
            final bool isSelected = widget.selectedId == option.id;
            return GestureDetector(
              onTap: () => widget.onSelected(option),
              child: Container(
                margin: const EdgeInsets.all( 8.0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected ? Color(0xff0E6B42) : Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 5,
                        offset: Offset(2, 2),
                      ),
                      BoxShadow(
                        color: Colors.white.withValues(alpha: 0.8),
                        blurRadius: 5,
                        offset: Offset(-2, -2),
                      ),

                  ],
                ),
                child: Row(
                  children: [
                    Icon(
                      option.icon,
                      color: isSelected ? Colors.white : Color(0xff4E3118),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      option.name,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Color(0xff4E3118),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      );
}
