import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final int stockQty;
  final String thumbnailUrl;

  final List<String> imageUrls;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stockQty,
    required this.thumbnailUrl,
    required this.imageUrls,
  });

  bool get isOutOfStock => stockQty <= 0;

  factory Product.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data() ?? {};
    return Product(
      id: doc.id,
      name: (data['name'] ?? '') as String,
      description: (data['description'] ?? '') as String,
      price: (data['price'] as num).toDouble(),
      stockQty: (data['stockQty'] ?? 0) as int,
      thumbnailUrl: (data['thumbnailUrl'] ?? '') as String,
      imageUrls: (data['imageUrls'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'stockQty': stockQty,
      'thumbnailUrl': thumbnailUrl,
      'imageUrls': imageUrls,
    };
  }

  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    int? stockQty,
    String? thumbnailUrl,
    List<String>? imageUrls,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      stockQty: stockQty ?? this.stockQty,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      imageUrls: imageUrls ?? this.imageUrls,
    );
  }
}
