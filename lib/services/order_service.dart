import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketapp/data/models/order_model.dart';

class OrderService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createOrder(OrderModel order) async {
    await _firestore.collection('orders').doc(order.id).set(order.toMap());
  }

  Future<OrderModel?> getOrder(String orderId) async {
    DocumentSnapshot doc = await _firestore.collection('orders').doc(orderId).get();
    if (doc.exists) {
      return OrderModel.fromDocument(doc);
    }
    return null;
  }

  Future<void> updateOrder(OrderModel order) async {
    await _firestore.collection('orders').doc(order.id).update(order.toMap());
  }

  Future<void> deleteOrder(String orderId) async {
    await _firestore.collection('orders').doc(orderId).delete();
  }

  Future<List<OrderModel>> getAllOrders() async {
    QuerySnapshot querySnapshot = await _firestore.collection('orders').get();
    return querySnapshot.docs.map((doc) => OrderModel.fromDocument(doc)).toList();
  }
}
