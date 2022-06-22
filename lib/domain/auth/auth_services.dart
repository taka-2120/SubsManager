import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authServicesProvider = Provider((ref) => AuthServices());

class AuthServices {
  AuthServices();
  final _auth = FirebaseAuth.instance;

  String get currentUid => _auth.currentUser!.uid;
  String? get currentuserName => _auth.currentUser!.displayName;
  String? get currentuserEmail => _auth.currentUser!.email;

  Future<void> signIn({
    required String email,
    required String pass,
  }) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: pass,
    );
    _auth.authStateChanges();
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _auth.authStateChanges();
  }

  Future<void> register({
    required String email,
    required String pass,
    required String name,
  }) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: pass,
    );
    _auth.currentUser!.updateDisplayName(name);
    _auth.authStateChanges();
  }
}
