import 'dart:convert';

class Product {
  String name;
  String restaurant;
  String imgurl;
  // String duration;
  // String price;
  // String rank;
  // String category;
  // List<String> toppings;
  Product(
    // this.duration,
    // this.price,
    // this.rank,
    // this.category,
    // this.toppings,
    this.name,
    this.restaurant,
    this.imgurl,
  );

  Product copyWith({
    String? name,
    String? restaurant,
    String? imgurl,
  }) {
    return Product(
      name ?? this.name,
      restaurant ?? this.restaurant,
      imgurl ?? this.imgurl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'restaurant': restaurant,
      'imgurl': imgurl,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      map['name'],
      map['restaurant'],
      map['imgurl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() =>
      'Product(name: $name, restaurant: $restaurant, imgurl: $imgurl)';
}
