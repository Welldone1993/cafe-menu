import '../model/item_view_model.dart';

class HomePageRepository {
  ItemViewModel getMenuItem(final int id) =>
      items.firstWhere((e) => e.id == id);

  final List<ItemViewModel> items = [
    ItemViewModel(
      id: 1,
      name: "Cake",
      taste: "Sweet",
      degree: "Medium",
      freshness: "Fresh",
      rate: 5,
      pricePerQuantity: 15.99,
      imageSource: "assets/cake.jpg",
    ),
    ItemViewModel(
      id: 2,
      name: "Pizza",
      taste: "Savory",
      degree: "Hot",
      freshness: "Fresh",
      rate: 4,
      pricePerQuantity: 12.49,
      imageSource: "assets/pizza.jpg",
    ),
    ItemViewModel(
      id: 3,
      name: "Elite",
      taste: "Unique",
      degree: "Cold",
      freshness: "Moderate",
      rate: 3,
      pricePerQuantity: 18.99,
      imageSource: "assets/elite.jpg",
    ),
    ItemViewModel(
      id: 4,
      name: "Juice",
      taste: "Fruity",
      degree: "Cold",
      freshness: "Fresh",
      rate: 5,
      pricePerQuantity: 5.99,
      imageSource: "assets/juice.jpg",
    ),
  ];
}
