import 'package:equatable/equatable.dart';
import 'package:marketapp/data/models/cart_item_model.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartItemModel> cartItems;

  CartLoaded(this.cartItems);

  @override
  List<Object> get props => [cartItems];
}

class CartError extends CartState {
  final String message;

  CartError(this.message);

  @override
  List<Object> get props => [message];
}
