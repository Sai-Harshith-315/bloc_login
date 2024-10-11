import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/repositories/auth_service_repo.dart';

class FirebaseAuthRepo implements AuthServiceRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> signUp(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print('Error signing up: $e');
    }
  }

  @override
  Future<void> login(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print('Error logging in: $e');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      print('Error logging out: $e');
    }
  }
}
