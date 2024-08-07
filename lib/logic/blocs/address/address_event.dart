import 'package:equatable/equatable.dart';
import 'package:marketapp/data/models/address_model.dart';

abstract class AddressEvent extends Equatable {
  const AddressEvent();

  @override
  List<Object> get props => [];
}

class LoadAddresses extends AddressEvent {
  final String userId;

  LoadAddresses(this.userId);

  @override
  List<Object> get props => [userId];
}

class AddAddress extends AddressEvent {
  final AddressModel address;

  AddAddress(this.address);

  @override
  List<Object> get props => [address];
}

class UpdateAddress extends AddressEvent {
  final AddressModel address;

  UpdateAddress(this.address);

  @override
  List<Object> get props => [address];
}

class DeleteAddress extends AddressEvent {
  final String addressId;

  DeleteAddress(this.addressId);

  @override
  List<Object> get props => [addressId];
}
