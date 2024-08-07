import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketapp/data/repositories/cart_repository.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository _cartRepository;

  CartBloc(this._cartRepository) : super(CartInitial()) {
    on<LoadCart>((event, emit) async {
      emit(CartLoading());
      try {
        final cartItems = await _cartRepository.getCartItems(event.userId);
        emit(CartLoaded(cartItems));
      } catch (e) {
        emit(CartError(e.toString()));
      }
    });

    on<AddCartItem>((event, emit) async {
      emit(CartLoading());
      try {
        await _cartRepository.addCartItem(event.cartItem, event.cartItem.userId); // Pass userId
        final cartItems = await _cartRepository.getCartItems(event.cartItem.userId);
        emit(CartLoaded(cartItems));
      } catch (e) {
        emit(CartError(e.toString()));
      }
    });

    on<UpdateCartItem>((event, emit) async {
      emit(CartLoading());
      try {
        await _cartRepository.updateCartItem(event.cartItem, event.cartItem.userId); // Pass userId
        final cartItems = await _cartRepository.getCartItems(event.cartItem.userId);
        emit(CartLoaded(cartItems));
      } catch (e) {
        emit(CartError(e.toString()));
      }
    });

    on<RemoveCartItem>((event, emit) async {
      emit(CartLoading());
      try {
        await _cartRepository.removeCartItem(event.cartItemId, event.cartItemId); // Pass userId
        final cartItems = await _cartRepository.getCartItems(event.cartItemId);
        emit(CartLoaded(cartItems));
      } catch (e) {
        emit(CartError(e.toString()));
      }
    });

    on<ClearCart>((event, emit) async {
      emit(CartLoading());
      try {
        await _cartRepository.clearCart(event.userId);
        emit(CartLoaded([]));
      } catch (e) {
        emit(CartError(e.toString()));
      }
    });
  }
}
