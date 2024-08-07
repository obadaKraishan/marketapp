class PaymentMethodModel {
  final String paymentMethodId;
  final String cardNumber;
  final String expiryDate;
  final String cardholderName;

  PaymentMethodModel({
    required this.paymentMethodId,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardholderName,
  });

  factory PaymentMethodModel.fromMap(Map<String, dynamic> data) {
    return PaymentMethodModel(
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
