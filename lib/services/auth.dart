import 'package:firebase_auth/firebase_auth.dart';
import 'package:pharmap/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Database _db = Database();

  Stream<User> get user {
    return _auth.authStateChanges();
  }

  Future<User> signupWithEmailAndPassword(String emailAddress, String password,
      String fullName, int phoneNumber) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      User createdUser = userCredential.user;
      await _db.addUserInfo(createdUser.uid, fullName, phoneNumber);
      return createdUser;
    } catch (error) {
      return null;
    }
  }
  // sign in with email and password
  // sign in with email and password
  // sign in with google

  Future<void> signout() async {
    try {
      return _auth.signOut();
    } catch (error) {
      return null;
    }
  }
}
