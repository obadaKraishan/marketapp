import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketapp/data/models/cart_item_model.dart';
import 'package:marketapp/data/models/cart_model.dart';

class CartService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createCart(CartModel cart) async {
    await _firestore.collection('carts').doc(cart.id).set(cart.toMap());
  }

  Future<CartModel?> getCart(String cartId) async {
    DocumentSnapshot doc = await _firestore.collection('carts').doc(cartId).get();
    if (doc.exists) {
      return CartModel.fromDocument(doc);
    }
    return null;
  }

  Future<List<CartItemModel>> getCartItems(String userId) async {
    QuerySnapshot querySnapshot = await _firestore.collection('carts')
        .where('user_id', isEqualTo: userId).get();
    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first['items'].map<CartItemModel>((item) => CartItemModel.fromMap(item)).toList();
    }
    return [];
  }

  Future<void> addCartItem(CartItemModel cartItem, String userId) async {
    QuerySnapshot querySnapshot = await _firestore.collection('carts')
        .where('user_id', isEqualTo: userId).get();
    if (querySnapshot.docs.isNotEmpty) {
      List<CartItemModel> items = List<CartItemModel>.from(querySnapshot.docs.first['items'].map((item) => CartItemModel.fromMap(item)));
      items.add(cartItem);
      await _firestore.collection('carts').doc(querySnapshot.docs.first.id).update({'items': items.map((e) => e.toMap()).toList()});
    } else {
      await createCart(CartModel(id: _firestore.collection('carts').doc().id, userId: userId, items: [cartItem]));
    }
  }

  Future<void> updateCartItem(CartItemModel cartItem, String userId) async {
    QuerySnapshot querySnapshot = await _firestore.collection('carts')
        .where('user_id', isEqualTo: userId).get();
    if (querySnapshot.docs.isNotEmpty) {
      List<CartItemModel> items = List<CartItemModel>.from(querySnapshot.docs.first['items'].map((item) => CartItemModel.fromMap(item)));
      int index = items.indexWhere((item) => item.productId == cartItem.productId && item.variantId == cartItem.variantId);
      if (index != -1) {
        items[index] = cartItem;
      }
      await _firestore.collection('carts').doc(querySnapshot.docs.first.id).update({'items': items.map((e) => e.toMap()).toList()});
    }
  }

  Future<void> removeCartItem(String cartItemId, String userId) async {
    QuerySnapshot querySnapshot = await _firestore.collection('carts')
        .where('user_id', isEqualTo: userId).get();
    if (querySnapshot.docs.isNotEmpty) {
      List<CartItemModel> items = List<CartItemModel>.from(querySnapshot.docs.first['items'].map((item) => CartItemModel.fromMap(item)));
      items.removeWhere((item) => item.productId == cartItemId);
      await _firestore.collection('carts').doc(querySnapshot.docs.first.id).update({'items': items.map((e) => e.toMap()).toList()});
    }
  }

  Future<void> clearCart(String userId) async {
    QuerySnapshot querySnapshot = await _firestore.collection('carts')
        .where('user_id', isEqualTo: userId).get();
    if (querySnapshot.docs.isNotEmpty) {
      await _firestore.collection('carts').doc(querySnapshot.docs.first.id).update({'items': []});
    }
  }

  Future<void> updateCart(CartModel cart) async {
    await _firestore.collection('carts').doc(cart.id).update(cart.toMap());
  }

  Future<void> deleteCart(String cartId) async {
    await _firestore.collection('carts').doc(cartId).delete();
  }
}
