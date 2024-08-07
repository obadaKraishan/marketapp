import 'package:equatable/equatable.dart';
import 'package:marketapp/data/models/payment_method_model.dart';

abstract class PaymentMethodState extends Equatable {
  const PaymentMethodState();

  @override
  List<Object> get props => [];
}

class PaymentMethodInitial extends PaymentMethodState {}

class PaymentMethodLoading extends PaymentMethodState {}

class PaymentMethodLoaded extends PaymentMethodState {
  final PaymentMethodModel paymentMethod;

  PaymentMethodLoaded(this.paymentMethod);

  @override
  List<Object> get props => [paymentMethod];
}

class PaymentMethodError extends PaymentMethodState {
  final String message;

  PaymentMethodError(this.message);

  @override
  List<Object> get props => [message];
}
