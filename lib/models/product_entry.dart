import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));
String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
  String id;
  String name;
  int price;
  String description;
  String thumbnail;
  String category;
  bool isFeatured;
  int stock;
  int rating;
  String? brand;
  String? size;
  String? color;
  DateTime createdAt;
  int? userId;

  ProductEntry({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.thumbnail,
    required this.category,
    required this.isFeatured,
    required this.stock,
    required this.rating,
    this.brand,
    this.size,
    this.color,
    required this.createdAt,
    this.userId,
  });

  factory ProductEntry.fromJson(Map<String, dynamic> json) {
    return ProductEntry(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      price: json["price"] ?? 0,
      description: json["description"] ?? "",
      thumbnail: json["thumbnail"] ?? "",
      category: json["category"] ?? "",
      isFeatured: json["is_featured"] ?? false,
      stock: json["stock"] ?? 0,
      rating: json["rating"] ?? 0,
      brand: json["brand"],
      size: json["size"],
      color: json["color"],
      createdAt: json["created_at"] != null
          ? DateTime.parse(json["created_at"])
          : DateTime.now(),
      userId: json["owner_id"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "description": description,
    "thumbnail": thumbnail,
    "category": category,
    "is_featured": isFeatured,
    "stock": stock,
    "rating": rating,
    "brand": brand,
    "size": size,
    "color": color,
    "created_at": createdAt.toIso8601String(),
    "owner_id": userId,
  };
}