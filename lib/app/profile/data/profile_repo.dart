import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final userRef = FirebaseFirestore.instance.collection('users');
  Future<void> signOut() async {
    Future.wait([
      _firebaseAuth.signOut(),
      //   _googleSignIn.signOut(),
    ]);
  }

  Future<bool> isSignedIn() async {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  Future addUser() async {
    try {
      final user = _firebaseAuth.currentUser;

      userRef.doc(user?.uid).set({
        'email': user?.email,
        'name': user?.displayName,
        'imgurl': user?.photoURL,
        'phone': user?.phoneNumber,
        'favorites': [],
        'basket': []
      });
    } on FirebaseException {
      rethrow;
    }
  }

  Future getUser() async {
    try {
      final currentUser = _firebaseAuth.currentUser;
      final user = await userRef.doc(currentUser?.uid).get();

      return user;
    } on FirebaseException {
      rethrow;
    }
  }
}
