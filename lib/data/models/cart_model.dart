import 'package:cloud_firestore/cloud_firestore.dart';
import 'cart_item_model.dart';

class CartModel {
  final String id;
  final String userId;
  final List<CartItemModel> items;

  CartModel({
    required this.id,
    required this.userId,
    required this.items,
  });

  factory CartModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return CartModel(
      id: doc.id,
      userId: data['user_id'],
      items: List<CartItemModel>.from(data['items'].map((item) => CartItemModel.fromMap(item))),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'items': items.map((item) => item.toMap()).toList(),
    };
  }
}
