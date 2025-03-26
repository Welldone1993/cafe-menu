import 'package:flutter/material.dart';

class CategoryDto {
  final String id;
  final String title;
  final IconData? icon;

  CategoryDto({
    required this.title,
    required this.id,
    this.icon,
  });

  /// **ذخیره مقدار `codePoint` آیکون به‌عنوان `String`**
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'icon': icon?.codePoint.toString(),
    };
  }

  /// **بازیابی `icon` فقط در صورتی که مقدار آن `null` نباشد**
  factory CategoryDto.fromJson(Map<String, dynamic> json) {
    return CategoryDto(
      id: json['\$id'],
      title: json['title'],
      icon: json['icon'] != null
          ? IconData(int.tryParse(json['icon']) ?? 0,
              fontFamily: 'MaterialIcons')
          : null,
    );
  }
}
