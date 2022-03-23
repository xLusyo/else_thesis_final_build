import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'user.dart';

class Auth {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(user.uid, user.email.toString());
  }

  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<User?> signWithEmailAndPassword(String email, String password) async {
    final credits = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    return _userFromFirebase(credits.user);
  }

  Future<User?> registerWithEmailAndPassword(
      String email, String password) async {
    final credits = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    return _userFromFirebase(credits.user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut(); 
  }
}
