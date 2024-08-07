import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketapp/data/models/payment_method_model.dart';

class PaymentService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createPaymentMethod(PaymentMethodModel paymentMethod) async {
    await _firestore
        .collection('payment_methods')
        .doc(paymentMethod.paymentMethodId)
        .set(paymentMethod.toMap());
  }

  Future<PaymentMethodModel?> getPaymentMethod(String paymentMethodId) async {
    DocumentSnapshot doc =
    await _firestore.collection('payment_methods').doc(paymentMethodId).get();
    if (doc.exists) {
      return PaymentMethodModel.fromMap(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  Future<void> updatePaymentMethod(PaymentMethodModel paymentMethod) async {
    await _firestore
        .collection('payment_methods')
        .doc(paymentMethod.paymentMethodId)
        .update(paymentMethod.toMap());
  }

  Future<void> deletePaymentMethod(String paymentMethodId) async {
    await _firestore.collection('payment_methods').doc(paymentMethodId).delete();
  }

  Future<List<PaymentMethodModel>> getAllPaymentMethods() async {
    QuerySnapshot querySnapshot = await _firestore.collection('payment_methods').get();
    return querySnapshot.docs
        .map((doc) => PaymentMethodModel.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
