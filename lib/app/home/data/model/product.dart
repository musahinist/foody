import 'dart:convert';

class Product {
  String name;
  String restaurant;
  String imgurl;
  String description;
  // String duration;
  double price;
  double rank;
  // String category;
  List<String> toppings;
  Product({
    required this.name,
    required this.restaurant,
    required this.imgurl,
    required this.description,
    required this.price,
    required this.rank,
    required this.toppings,
  });

  Product copyWith({
    String? name,
    String? restaurant,
    String? imgurl,
    String? description,
    double? price,
    double? rank,
    List<String>? toppings,
  }) {
    return Product(
      name: name ?? this.name,
      restaurant: restaurant ?? this.restaurant,
      imgurl: imgurl ?? this.imgurl,
      description: description ?? this.description,
      price: price ?? this.price,
      rank: rank ?? this.rank,
      toppings: toppings ?? this.toppings,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'restaurant': restaurant,
      'imgurl': imgurl,
      'description': description,
      'price': price,
      'rank': rank,
      'toppings': toppings,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'],
      restaurant: map['restaurant'],
      imgurl: map['imgurl'],
      description: map['description'],
      price: map['price'].toDouble(),
      rank: map['rank'].toDouble(),
      toppings: List<String>.from(map['toppings']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(name: $name, restaurant: $restaurant, imgurl: $imgurl, description: $description, price: $price, rank: $rank, toppings: $toppings)';
  }
}
