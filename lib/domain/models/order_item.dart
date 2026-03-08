class OrderItem {
  final String productId; // reference to Product class
  final String name;
  final double price;
  final int quantity;
  final String thumbnailUrl;

  const OrderItem({
    required this.productId,
    required this.name,
    required this.price,
    required this.quantity,
    required this.thumbnailUrl,
  });

  double get subtotal => price * quantity;

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'name': name,
        'price': price,
        'quantity': quantity,
        'imageUrls': thumbnailUrl,
      };

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        productId: (json['productId'] ?? '') as String,
        name: (json['name'] ?? '') as String,
        price: ((json['price'] ?? 0) as num).toDouble(),
        quantity: ((json['quantity'] ?? 0) as num).toInt(),
        thumbnailUrl: (json['thumbnailUrl'] ?? '') as String,
      );
}
