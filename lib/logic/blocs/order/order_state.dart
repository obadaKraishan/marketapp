import 'package:equatable/equatable.dart';
import 'package:marketapp/data/models/order_model.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderLoaded extends OrderState {
  final OrderModel order;

  OrderLoaded(this.order);

  @override
  List<Object> get props => [order];
}

class OrderError extends OrderState {
  final String message;

  OrderError(this.message);

  @override
  List<Object> get props => [message];
}
