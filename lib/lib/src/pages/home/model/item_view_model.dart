class ItemViewModel {
  ItemViewModel({
    required this.id,
    required this.name,
    required this.imageSource,
    required this.taste,
    required this.degree,
    required this.freshness,
    required this.rate,
    required this.pricePerQuantity,
  });

  final int id;
  final String name;
  final String imageSource;
  final String taste;
  final String degree;
  final String freshness;
  final int rate;
  final double pricePerQuantity;
}
