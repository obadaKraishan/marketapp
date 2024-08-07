import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String profileImageUrl;
  final List<Address> addresses;
  final List<PaymentMethod> paymentMethods;
  final int loyaltyPoints;
  final List<String> orderHistory;
  final List<String> wishlist;
  final Settings settings;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.profileImageUrl,
    required this.addresses,
    required this.paymentMethods,
    required this.loyaltyPoints,
    required this.orderHistory,
    required this.wishlist,
    required this.settings,
  });

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return UserModel(
      id: doc.id,
      name: data['name'],
      email: data['email'],
      phoneNumber: data['phone_number'],
      profileImageUrl: data['profile_image_url'],
      addresses: List<Address>.from(data['addresses'].map((item) => Address.fromMap(item))),
      paymentMethods: List<PaymentMethod>.from(data['payment_methods'].map((item) => PaymentMethod.fromMap(item))),
      loyaltyPoints: data['loyalty_points'],
      orderHistory: List<String>.from(data['order_history']),
      wishlist: List<String>.from(data['wishlist']),
      settings: Settings.fromMap(data['settings']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
      'profile_image_url': profileImageUrl,
      'addresses': addresses.map((item) => item.toMap()).toList(),
      'payment_methods': paymentMethods.map((item) => item.toMap()).toList(),
      'loyalty_points': loyaltyPoints,
      'order_history': orderHistory,
      'wishlist': wishlist,
      'settings': settings.toMap(),
    };
  }
}

class Address {
  final String addressId;
  final String addressLine1;
  final String addressLine2;
  final String city;
  final String state;
  final String postalCode;
  final String country;

  Address({
    required this.addressId,
    required this.addressLine1,
    required this.addressLine2,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
  });

  factory Address.fromMap(Map<String, dynamic> data) {
    return Address(
      addressId: data['address_id'],
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
      'address_line1': addressLine1,
      'address_line2': addressLine2,
      'city': city,
      'state': state,
      'postal_code': postalCode,
      'country': country,
    };
  }
}

class PaymentMethod {
  final String paymentMethodId;
  final String cardNumber;
  final String expiryDate;
  final String cardholderName;

  PaymentMethod({
    required this.paymentMethodId,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardholderName,
  });

  factory PaymentMethod.fromMap(Map<String, dynamic> data) {
    return PaymentMethod(
      paymentMethodId: data['payment_method_id'],
      cardNumber: data['card_number'],
      expiryDate: data['expiry_date'],
      cardholderName: data['cardholder_name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'payment_method_id': paymentMethodId,
      'card_number': cardNumber,
      'expiry_date': expiryDate,
      'cardholder_name': cardholderName,
    };
  }
}

class Settings {
  final bool notificationsEnabled;
  final String language;
  final bool darkMode;

  Settings({
    required this.notificationsEnabled,
    required this.language,
    required this.darkMode,
  });

  factory Settings.fromMap(Map<String, dynamic> data) {
    return Settings(
      notificationsEnabled: data['notifications_enabled'],
      language: data['language'],
      darkMode: data['dark_mode'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'notifications_enabled': notificationsEnabled,
      'language': language,
      'dark_mode': darkMode,
    };
  }
}
