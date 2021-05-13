import 'package:cloud_firestore/cloud_firestore.dart';

import '../../auth/data/temp.dart';
import '../../auth/data/temp_provider.dart';
import 'model/product.dart';

class HomeRepo {
//  TempProvider tempProvider = TempProvider();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final productRef = FirebaseFirestore.instance.collection('products');
  Future<List<Product>> getProducts() async {
    final products = await productRef.get().then((snapshot) => snapshot.docs
        .map<Product>((doc) => Product.fromMap(doc.data()))
        .toList());
    print(products[0].name);
    return products;
  }

  // List<Product> getProducts() {
  //   final List<Product> products = [
  //     Product(
  //         'Beef Burgers',
  //         'Burger King',
  //         'https://i2.wp.com/www.eatthis.com/wp-content/uploads/media/images/ext/520765216/classic-beef-burger.jpg?resize=684%2C500&ssl=1',
  //         '20-25 min',
  //         '50',
  //         '4.9',
  //         'Burger', []),
  //     Product(
  //         'Elk Burgers',
  //         'Burger King',
  //         'https://i2.wp.com/www.eatthis.com/wp-content/uploads/media/images/ext/316673155/elk-burger.jpg?resize=684%2C500&ssl=1',
  //         '20-25 min',
  //         '50',
  //         '4.9',
  //         'Burger', []),
  //     Product(
  //         'Veggie Burgers',
  //         'Burger King',
  //         'https://i1.wp.com/www.eatthis.com/wp-content/uploads/media/images/ext/351400125/pumpkin-veggie-burger.jpg?resize=684%2C500&ssl=1',
  //         '20-25 min',
  //         '50',
  //         '4.9',
  //         'Burger', []),
  //     Product(
  //         'Wild Salmon Burgers',
  //         'Burger King',
  //         'https://i2.wp.com/www.eatthis.com/wp-content/uploads/media/images/ext/148632216/salmon-burger.jpg?resize=684%2C500&ssl=1',
  //         '20-25 min',
  //         '50',
  //         '4.9',
  //         'Burger', []),
  //   ];
  //   return products;
  // }
}
//  String name;
//   String restaurant;
//   String imgurl;
//   String duration;
//   String price;
//   String rank;
//   String category;
//   List<String> toppings;