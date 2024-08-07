import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel {
  final String addressId;
  final String userId;
  final String addressLine1;
  final String addressLine2;
  final String city;
  final String state;
  final String postalCode;
  final String country;

  AddressModel({
    required this.addressId,
    required this.userId,
    required this.addressLine1,
    required this.addressLine2,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
  });

  factory AddressModel.fromMap(Map<String, dynamic> data) {
    return AddressModel(
      addressId: data['address_id'],
      userId: data['user_id'],
      addressLine1: data['address_line1'],
      addressLine2: data['address_line2'],
      city: data['city'],
      state: data['state'],
      postalCode: data['postal_code'],
      country: data['country'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'address_id': addressId,
      'user_id': userId,
      'address_line1': addressLine1,
      'address_line2': addressLine2,
      'city': city,
      'state': state,
      'postal_code': postalCode,
      'country': country,
    };
  }

  factory AddressModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return AddressModel(
      addressId: doc.id,
      userId: data['user_id'],
      addressLine1: data['address_line1'],
      addressLine2: data['address_line2'],
      city: data['city'],
      state: data['state'],
      postalCode: data['postal_code'],
      country: data['country'],
    );
  }
}
