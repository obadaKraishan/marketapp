import 'package:equatable/equatable.dart';
import 'package:marketapp/data/models/cart_item_model.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCart extends CartEvent {
  final String userId;

  LoadCart(this.userId);

  @override
  List<Object> get props => [userId];
}

class AddCartItem extends CartEvent {
  final CartItemModel cartItem;

  AddCartItem(this.cartItem);

  @override
  List<Object> get props => [cartItem];
}

class UpdateCartItem extends CartEvent {
  final CartItemModel cartItem;

  UpdateCartItem(this.cartItem);

  @override
  List<Object> get props => [cartItem];
}

class RemoveCartItem extends CartEvent {
  final String cartItemId;

  RemoveCartItem(this.cartItemId);

  @override
  List<Object> get props => [cartItemId];
}

class ClearCart extends CartEvent {
  final String userId;

  ClearCart(this.userId);

  @override
  List<Object> get props => [userId];
}
