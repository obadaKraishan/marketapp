import 'package:equatable/equatable.dart';
import 'package:marketapp/data/models/user_model.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUser extends UserEvent {
  final String userId;

  LoadUser(this.userId);

  @override
  List<Object> get props => [userId];
}

class CreateUser extends UserEvent {
  final UserModel user;

  CreateUser(this.user);

  @override
  List<Object> get props => [user];
}

class UpdateUser extends UserEvent {
  final UserModel user;

  UpdateUser(this.user);

  @override
  List<Object> get props => [user];
}

class DeleteUser extends UserEvent {
  final String userId;

  DeleteUser(this.userId);

  @override
  List<Object> get props => [userId];
}
