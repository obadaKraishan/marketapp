import 'package:marketapp/data/models/address_model.dart';
import 'package:marketapp/services/address_service.dart';

class AddressRepository {
  final AddressService _addressService = AddressService();

  Future<void> createAddress(AddressModel address) async {
    await _addressService.createAddress(address);
  }

  Future<AddressModel?> getAddress(String addressId) async {
    return await _addressService.getAddress(addressId);
  }

  Future<void> updateAddress(AddressModel address) async {
    await _addressService.updateAddress(address);
  }

  Future<void> deleteAddress(String addressId) async {
    await _addressService.deleteAddress(addressId);
  }

  Future<List<AddressModel>> getAllAddressesForUser(String userId) async {
    return await _addressService.getAllAddressesForUser(userId);
  }
}
