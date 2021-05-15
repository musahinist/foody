import 'package:cloud_firestore/cloud_firestore.dart';

import 'model/product.dart';

class HomeRepo {
//  TempProvider tempProvider = TempProvider();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final productRef = FirebaseFirestore.instance.collection('products');
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
}
