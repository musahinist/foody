import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'temp.dart';
import 'temp_provider.dart';

class AuthRepo {
  TempProvider tempProvider = TempProvider();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = (await _googleSignIn.signIn())!;
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _firebaseAuth.signInWithCredential(credential);
    return _firebaseAuth.currentUser;
  }

  Future<void> signInWithCredentials(
      {required String email, required String password}) {
    try {
      return _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        throw 'Wrong password provided for that user.';
      }
      rethrow;
    }
  }

  Future<UserCredential> signUp(
      {required String email, required String password}) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

  Future<bool> isSignedIn() async {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  Future<String?> getUser() async {
    final user = _firebaseAuth.currentUser;
    return user?.email;
  }

  Future<List<Temp>> getReddits() async {
    try {
      final response = await tempProvider.getTemp();
      final List<Temp> temps = response.data['data']
          .map<Temp>((temp) => Temp.fromMap(temp))
          .toList();
      return temps;
    } catch (e) {
      rethrow;
    }
  }
}
