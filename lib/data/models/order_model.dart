import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketapp/data/models/user_model.dart';
import 'order_item_model.dart';
import 'address_model.dart';
import 'payment_method_model.dart';

class OrderModel {
  final String id;
  final String userId;
  final Timestamp orderDate;
  final Timestamp deliveryDate;
  final String orderStatus;
  final double orderTotal;
  final List<OrderItemModel> items;
  final Address shippingAddress;
  final Address billingAddress;
  final PaymentMethod paymentMethod;
  final int loyaltyPointsUsed;
  final String discountCode;

  OrderModel({
    required this.id,
    required this.userId,
    required this.orderDate,
    required this.deliveryDate,
    required this.orderStatus,
    required this.orderTotal,
    required this.items,
    required this.shippingAddress,
    required this.billingAddress,
    required this.paymentMethod,
    required this.loyaltyPointsUsed,
    required this.discountCode,
  });

  factory OrderModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return OrderModel(
      id: doc.id,
      userId: data['user_id'],
      orderDate: data['order_date'],
      deliveryDate: data['delivery_date'],
      orderStatus: data['order_status'],
      orderTotal: data['order_total'].toDouble(),
      items: List<OrderItemModel>.from(data['items'].map((item) => OrderItemModel.fromMap(item))),
      shippingAddress: Address.fromMap(data['shipping_address']),
      billingAddress: Address.fromMap(data['billing_address']),
      paymentMethod: PaymentMethod.fromMap(data['payment_method']),
      loyaltyPointsUsed: data['loyalty_points_used'],
      discountCode: data['discount_code'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'order_date': orderDate,
      'delivery_date': deliveryDate,
      'order_status': orderStatus,
      'order_total': orderTotal,
      'items': items.map((item) => item.toMap()).toList(),
      'shipping_address': shippingAddress.toMap(),
      'billing_address': billingAddress.toMap(),
      'payment_method': paymentMethod.toMap(),
      'loyalty_points_used': loyaltyPointsUsed,
      'discount_code': discountCode,
    };
  }
}
