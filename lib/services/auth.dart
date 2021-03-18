import 'package:firebase_auth/firebase_auth.dart';
import 'package:pharmap/models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel _mapToUserModel(User user) {
    return user != null ? UserModel(uid: user.uid, email: user.email) : null;
  }

  Stream<UserModel> get user {
    return _auth.authStateChanges().map(_mapToUserModel);
  }

  Future<UserModel> signupWithEmailAndPassword(
      String emailAddress, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      User createdUser = userCredential.user;
      return _mapToUserModel(createdUser);
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
