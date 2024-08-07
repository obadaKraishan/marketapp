import 'package:equatable/equatable.dart';
import 'package:marketapp/data/models/payment_method_model.dart';

abstract class PaymentMethodEvent extends Equatable {
  const PaymentMethodEvent();

  @override
  List<Object> get props => [];
}

class LoadPaymentMethod extends PaymentMethodEvent {
  final String paymentMethodId;

  LoadPaymentMethod(this.paymentMethodId);

  @override
  List<Object> get props => [paymentMethodId];
}

class CreatePaymentMethod extends PaymentMethodEvent {
  final PaymentMethodModel paymentMethod;

  CreatePaymentMethod(this.paymentMethod);

  @override
  List<Object> get props => [paymentMethod];
}

class UpdatePaymentMethod extends PaymentMethodEvent {
  final PaymentMethodModel paymentMethod;

  UpdatePaymentMethod(this.paymentMethod);

  @override
  List<Object> get props => [paymentMethod];
}

class DeletePaymentMethod extends PaymentMethodEvent {
  final String paymentMethodId;

  DeletePaymentMethod(this.paymentMethodId);

  @override
  List<Object> get props => [paymentMethodId];
}
