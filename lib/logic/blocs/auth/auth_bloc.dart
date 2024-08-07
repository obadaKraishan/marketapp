import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketapp/data/repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(AuthInitial()) {
    on<SignInRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        User? user = await _authRepository.signInWithEmailAndPassword(
          event.email,
          event.password,
        );
        emit(AuthAuthenticated(user!));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<SignUpRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        User? user = await _authRepository.createUserWithEmailAndPassword(
          event.email,
          event.password,
        );
        emit(AuthAuthenticated(user!));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<SignOutRequested>((event, emit) async {
      emit(AuthLoading());
      await _authRepository.signOut();
      emit(AuthUnauthenticated());
    });

    on<AuthCheckRequested>((event, emit) async {
      _authRepository.authStateChanges.listen((User? user) {
        if (user != null) {
          emit(AuthAuthenticated(user));
        } else {
          emit(AuthUnauthenticated());
        }
      });
    });
  }
}
