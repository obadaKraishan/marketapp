import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketapp/data/repositories/address_repository.dart';
import 'address_event.dart';
import 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddressRepository _addressRepository;

  AddressBloc(this._addressRepository) : super(AddressInitial()) {
    on<LoadAddresses>((event, emit) async {
      emit(AddressLoading());
      try {
        final addresses = await _addressRepository.getAllAddressesForUser(event.userId);
        emit(AddressLoaded(addresses));
      } catch (e) {
        emit(AddressError(e.toString()));
      }
    });

    on<AddAddress>((event, emit) async {
      emit(AddressLoading());
      try {
        await _addressRepository.createAddress(event.address);
        final addresses = await _addressRepository.getAllAddressesForUser(event.address.userId);
        emit(AddressLoaded(addresses));
      } catch (e) {
        emit(AddressError(e.toString()));
      }
    });

    on<UpdateAddress>((event, emit) async {
      emit(AddressLoading());
      try {
        await _addressRepository.updateAddress(event.address);
        final addresses = await _addressRepository.getAllAddressesForUser(event.address.userId);
        emit(AddressLoaded(addresses));
      } catch (e) {
        emit(AddressError(e.toString()));
      }
    });

    on<DeleteAddress>((event, emit) async {
      emit(AddressLoading());
      try {
        await _addressRepository.deleteAddress(event.addressId);
        final addresses = await _addressRepository.getAllAddressesForUser(event.addressId);
        emit(AddressLoaded(addresses));
      } catch (e) {
        emit(AddressError(e.toString()));
      }
    });
  }
}
