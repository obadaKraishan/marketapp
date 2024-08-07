import 'package:marketapp/data/models/payment_method_model.dart';
import 'package:marketapp/services/payment_service.dart';

class PaymentRepository {
  final PaymentService _paymentService = PaymentService();

  Future<void> createPaymentMethod(PaymentMethodModel paymentMethod) async {
    await _paymentService.createPaymentMethod(paymentMethod);
  }

  Future<PaymentMethodModel?> getPaymentMethod(String paymentMethodId) async {
    return await _paymentService.getPaymentMethod(paymentMethodId);
  }

  Future<void> updatePaymentMethod(PaymentMethodModel paymentMethod) async {
    await _paymentService.updatePaymentMethod(paymentMethod);
  }

  Future<void> deletePaymentMethod(String paymentMethodId) async {
    await _paymentService.deletePaymentMethod(paymentMethodId);
  }

  Future<List<PaymentMethodModel>> getAllPaymentMethods() async {
    return await _paymentService.getAllPaymentMethods();
  }
}
