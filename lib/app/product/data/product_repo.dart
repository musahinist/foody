import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foody/app/auth/data/temp_provider.dart';
import 'package:foody/config/globals.dart';
import 'package:foody/util/http/http_manager.dart';

class ProductRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final orderRef = FirebaseFirestore.instance.collection('orders');

  Future addToBasket(order) async {
    try {
      final user = _firebaseAuth.currentUser;

      await orderRef.doc(user?.uid).update({
        'orders': FieldValue.arrayUnion([order])
      });
    } on FirebaseException {
      rethrow;
    }
  }

  Future removeFromBasket(order) async {
    try {
      final user = _firebaseAuth.currentUser;

      await orderRef.doc(user?.uid).update({
        'orders': FieldValue.arrayRemove([order])
      });
    } on FirebaseException {
      rethrow;
    }
  }

  Future<DocumentSnapshot<Map>> getOrders() async {
    try {
      final currentUser = _firebaseAuth.currentUser;
      final orders = await orderRef.doc(currentUser?.uid).get();
      int count = orders.data()!["orders"].length;
      orderCount = count;
      print(orderCount);
      return orders;
    } on FirebaseException {
      rethrow;
    }
  }
}
