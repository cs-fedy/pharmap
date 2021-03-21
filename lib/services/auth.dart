import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pharmap/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();
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

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (error) {
      return null;
    }
  }

  Future<User> signInWithGoogle(String fromScreen) async {
    GoogleSignInAccount user = await _googleSignIn.signIn();
    if (user != null) {
      GoogleSignInAuthentication googleAuth = await user.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User createdUser = userCredential.user;
      if (fromScreen == 'signup') {
        await _db.addUserInfo(createdUser.uid, createdUser.displayName, null);
      }
      return createdUser;
    }
    return null;
  }

  Future<void> sendVerificationEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> signout() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    if (await googleSignIn.isSignedIn()) {
      await googleSignIn.disconnect();
    }
    return await _auth.signOut();
  }
}
