class FoodModel {
  FoodModel({
    required this.id,
    required this.name,
    required this.price,
  });

  final String id;
  final String name;
  final double price;

  factory FoodModel.fromJson(Map<String, dynamic> json, String id) {
    return FoodModel(
      id: id,
      name: json["name"] ?? "",
      price: json["price"] ?? 0.toDouble(),
    );
  }
}
