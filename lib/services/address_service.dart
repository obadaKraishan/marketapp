import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketapp/data/models/address_model.dart';

class AddressService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createAddress(AddressModel address) async {
    await _firestore.collection('addresses').doc(address.addressId).set(address.toMap());
  }

  Future<AddressModel?> getAddress(String addressId) async {
    DocumentSnapshot doc = await _firestore.collection('addresses').doc(addressId).get();
    if (doc.exists) {
      return AddressModel.fromDocument(doc);
    }
    return null;
  }

  Future<void> updateAddress(AddressModel address) async {
    await _firestore.collection('addresses').doc(address.addressId).update(address.toMap());
  }

  Future<void> deleteAddress(String addressId) async {
    await _firestore.collection('addresses').doc(addressId).delete();
  }

  Future<List<AddressModel>> getAllAddressesForUser(String userId) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('addresses')
        .where('user_id', isEqualTo: userId)
        .get();
    return querySnapshot.docs
        .map((doc) => AddressModel.fromDocument(doc))
        .toList();
  }
}
