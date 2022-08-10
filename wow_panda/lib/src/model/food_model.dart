class FoodModel {
  FoodModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.images,
    required this.rating,
    required this.createdAt,
  });

  final String id;
  final String name;
  final String description;
  final num price;
  final List<String> images;
  final num rating;
  final int createdAt;

  factory FoodModel.fromJson(Map<String, dynamic> json, String docId) {
    return FoodModel(
      id: docId,
      name: json["name"] ?? "",
      description: json["description"] ?? "",
      price: json["price"] ?? 0.toDouble(),
      images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
      rating: json["rating"] ?? 0.toDouble(),
      createdAt: json["created_at"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "price": price,
        "images": List<String>.from(images.map((x) => x)),
        "rating": rating,
        "created_at": createdAt,
      };
}
