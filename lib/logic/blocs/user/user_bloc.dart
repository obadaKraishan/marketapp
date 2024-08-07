import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketapp/data/repositories/user_repository.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc(this._userRepository) : super(UserInitial()) {
    on<LoadUser>((event, emit) async {
      emit(UserLoading());
      try {
        final user = await _userRepository.getUser(event.userId);
        if (user != null) {
          emit(UserLoaded(user));
        } else {
          emit(UserError("User not found"));
        }
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });

    on<CreateUser>((event, emit) async {
      emit(UserLoading());
      try {
        await _userRepository.createUser(event.user);
        emit(UserLoaded(event.user));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });

    on<UpdateUser>((event, emit) async {
      emit(UserLoading());
      try {
        await _userRepository.updateUser(event.user);
        emit(UserLoaded(event.user));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });

    on<DeleteUser>((event, emit) async {
      emit(UserLoading());
      try {
        await _userRepository.deleteUser(event.userId);
        emit(UserInitial());
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
  }
}
