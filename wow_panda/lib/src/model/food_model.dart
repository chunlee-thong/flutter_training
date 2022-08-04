class FoodModel {
  FoodModel({
    required this.name,
    required this.price,
  });

  final String name;
  final double price;

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      name: json["name"] ?? "",
      price: json["price"] ?? 0.toDouble(),
    );
  }
}
