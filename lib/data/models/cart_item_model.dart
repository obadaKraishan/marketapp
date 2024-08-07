class CartItemModel {
  final String productId;
  final String variantId;
  final int quantity;
  final double price;
  final String userId; // Add this field

  CartItemModel({
    required this.productId,
    required this.variantId,
    required this.quantity,
    required this.price,
    required this.userId, // Add this field
  });

  factory CartItemModel.fromMap(Map<String, dynamic> data) {
    return CartItemModel(
      productId: data['product_id'],
      variantId: data['variant_id'],
      quantity: data['quantity'],
      price: data['price'].toDouble(),
      userId: data['user_id'], // Add this field
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'product_id': productId,
      'variant_id': variantId,
      'quantity': quantity,
      'price': price,
      'user_id': userId, // Add this field
    };
  }
}
