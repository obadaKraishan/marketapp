import 'package:equatable/equatable.dart';
import 'package:marketapp/data/models/order_model.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class LoadOrder extends OrderEvent {
  final String orderId;

  LoadOrder(this.orderId);

  @override
  List<Object> get props => [orderId];
}

class CreateOrder extends OrderEvent {
  final OrderModel order;

  CreateOrder(this.order);

  @override
  List<Object> get props => [order];
}

class UpdateOrder extends OrderEvent {
  final OrderModel order;

  UpdateOrder(this.order);

  @override
  List<Object> get props => [order];
}

class DeleteOrder extends OrderEvent {
  final String orderId;

  DeleteOrder(this.orderId);

  @override
  List<Object> get props => [orderId];
}
