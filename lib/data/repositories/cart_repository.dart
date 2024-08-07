import 'package:marketapp/data/models/cart_item_model.dart';
import 'package:marketapp/data/models/cart_model.dart';
import 'package:marketapp/services/cart_service.dart';

class CartRepository {
  final CartService _cartService = CartService();

  Future<void> createCart(CartModel cart) async {
    await _cartService.createCart(cart);
  }

  Future<CartModel?> getCart(String cartId) async {
    return await _cartService.getCart(cartId);
  }

  Future<List<CartItemModel>> getCartItems(String userId) async {
    return await _cartService.getCartItems(userId);
  }

  Future<void> addCartItem(CartItemModel cartItem, String userId) async {
    await _cartService.addCartItem(cartItem, userId);
  }

  Future<void> updateCartItem(CartItemModel cartItem, String userId) async {
    await _cartService.updateCartItem(cartItem, userId);
  }

  Future<void> removeCartItem(String cartItemId, String userId) async {
    await _cartService.removeCartItem(cartItemId, userId);
  }

  Future<void> clearCart(String userId) async {
    await _cartService.clearCart(userId);
  }

  Future<void> updateCart(CartModel cart) async {
    await _cartService.updateCart(cart);
  }

  Future<void> deleteCart(String cartId) async {
    await _cartService.deleteCart(cartId);
  }
}
