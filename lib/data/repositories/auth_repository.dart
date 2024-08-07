import 'package:marketapp/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final AuthService _authService = AuthService();

  Stream<User?> get authStateChanges => _authService.authStateChanges;

  Future<User?> signInWithEmailAndPassword(String email, String password) {
    return _authService.signInWithEmailAndPassword(email, password);
  }

  Future<User?> createUserWithEmailAndPassword(String email, String password) {
    return _authService.createUserWithEmailAndPassword(email, password);
  }

  Future<void> signOut() {
    return _authService.signOut();
  }
}
