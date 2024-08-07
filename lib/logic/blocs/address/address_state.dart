import 'package:equatable/equatable.dart';
import 'package:marketapp/data/models/address_model.dart';

abstract class AddressState extends Equatable {
  const AddressState();

  @override
  List<Object> get props => [];
}

class AddressInitial extends AddressState {}

class AddressLoading extends AddressState {}

class AddressLoaded extends AddressState {
  final List<AddressModel> addresses;

  AddressLoaded(this.addresses);

  @override
  List<Object> get props => [addresses];
}

class AddressError extends AddressState {
  final String message;

  AddressError(this.message);

  @override
  List<Object> get props => [message];
}
