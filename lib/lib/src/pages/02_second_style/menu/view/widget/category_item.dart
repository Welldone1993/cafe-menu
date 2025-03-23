import 'package:flutter/material.dart';

import '../../../../../infrastructure/utils/constants.dart';
import '../../model/category_item_view_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryItemViewModel item;

  const CategoryItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) => Container(
        constraints: BoxConstraints(
          minWidth: 100, // حداقل عرض آیتم
          maxWidth: double
              .infinity, // اجازه می‌دهد آیتم متناسب با `GridView` تنظیم شود
        ),
        margin: Constants.mediumPadding,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: Image.asset(
                      item.imageUrl,
                      height: 170,
                      width:
                          double.infinity, // عرض تصویر متناسب با عرض `GridView`
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 14),
                        SizedBox(width: 4),
                        Text(
                          item.rating.toString(),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    item.description,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
