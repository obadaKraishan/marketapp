class OrderItemModel {
  final String productId;
  final String variantId;
  final int quantity;
  final double price;

  OrderItemModel({
    required this.productId,
    required this.variantId,
    required this.quantity,
    required this.price,
  });

  factory OrderItemModel.fromMap(Map<String, dynamic> data) {
    return OrderItemModel(
      productId: data['product_id'],
      variantId: data['variant_id'],
      quantity: data['quantity'],
      price: data['price'].toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'product_id': productId,
      'variant_id': variantId,
      'quantity': quantity,
      'price': price,
    };
  }
}
