import 'package:marketapp/data/models/user_model.dart';
import 'package:marketapp/services/user_service.dart';

class UserRepository {
  final UserService _userService = UserService();

  Future<void> createUser(UserModel user) async {
    await _userService.createUser(user);
  }

  Future<UserModel?> getUser(String userId) async {
    return await _userService.getUser(userId);
  }

  Future<void> updateUser(UserModel user) async {
    await _userService.updateUser(user);
  }

  Future<void> deleteUser(String userId) async {
    await _userService.deleteUser(userId);
  }
}
