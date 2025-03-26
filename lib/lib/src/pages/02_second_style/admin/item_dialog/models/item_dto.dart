class ItemDto {
  final String id;
  final String title;
  final String description;
  final String? categoryId;
  final String? imageUrl;
  final String? fileId;
  final double? price;
  final double? rating;

  ItemDto({
    required this.title,
    required this.id,
    required this.description,
    this.categoryId,
    this.fileId,
    this.imageUrl,
    this.price,
    this.rating,
  });

  /// **ذخیره مقدار `codePoint` آیکون به‌عنوان `String`**
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'categoryId': categoryId,
      'fileId': fileId,
      'imageUrl': imageUrl,
      'price': price,
      'rating': rating,
    };
  }

  /// **بازیابی `icon` فقط در صورتی که مقدار آن `null` نباشد**
  factory ItemDto.fromJson(Map<String, dynamic> json) {
    return ItemDto(
      id: json['\$id'],
      title: json['title'],
      description: json['description'],
      categoryId: json['categoryId'],
      fileId: json['fileId'],
      imageUrl: json['imageUrl'],
      price: json['price'],
      rating: json['rating'],
    );
  }
}
