import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'model/product.dart';

class HomeRepo {
//  TempProvider tempProvider = TempProvider();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final productRef = FirebaseFirestore.instance.collection('products');
  final deliveryRef = FirebaseFirestore.instance.collection('delivery');
  Future<List<Product>> getProducts() async {
    try {
      final products = await productRef.get().then((snapshot) => snapshot.docs
          .map<Product>((doc) => Product.fromMap(doc.data()))
          .toList());
      return products;
    } on FirebaseException {
      rethrow;
    }
  }

  Future addToDelivery(order) async {
    try {
      final user = _firebaseAuth.currentUser;

      await deliveryRef
          .doc(user?.uid)
          .update({'delivery': FieldValue.arrayUnion(order)});
    } on FirebaseException {
      rethrow;
    }
  }

  Future completeDelivery(order) async {
    try {
      final user = _firebaseAuth.currentUser;

      await deliveryRef
          .doc(user?.uid)
          .update({'delivery': FieldValue.arrayUnion(order)});
    } on FirebaseException {
      rethrow;
    }
  }

  Future<DocumentSnapshot<Map>> getDelivery() async {
    try {
      final currentUser = _firebaseAuth.currentUser;
      final delivery = await deliveryRef.doc(currentUser?.uid).get();

      return delivery;
    } on FirebaseException {
      rethrow;
    }
  }
}
