import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'temp.dart';
import 'temp_provider.dart';

class AuthRepo {
  TempProvider tempProvider = TempProvider();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

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

  Future<void> signUp({required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await addUser();
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

  Future addUser() async {
    try {
      final user = _firebaseAuth.currentUser;
      final userRef = FirebaseFirestore.instance.collection('users');
      final orderRef = FirebaseFirestore.instance.collection('orders');
      final favRef = FirebaseFirestore.instance.collection('favorites');
      userRef.doc(user?.uid).set({
        'email': user?.email,
        'name': user?.displayName,
        'imgurl': user?.photoURL,
        'phone': user?.phoneNumber,
      });
      orderRef.doc(user?.uid).set({'orders': []});
      favRef.doc(user?.uid).set({'favorites': []});
      // final products = await productRef.get().then((snapshot) => snapshot.docs
      //     .map<Product>((doc) => Product.fromMap(doc.data()))
      //     .toList());
      // return products;
    } on FirebaseException {
      rethrow;
    }
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
