import 'dart:convert';

class Product {
  String name;
  String restaurant;
  String imgurl;
  String duration;
  String price;
  String rank;
  String category;
  List<String> toppings;
  Product(
    this.name,
    this.restaurant,
    this.imgurl,
    this.duration,
    this.price,
    this.rank,
    this.category,
    this.toppings,
  );

  Product copyWith({
    String? name,
    String? restaurant,
    String? imgurl,
    String? duration,
    String? price,
    String? rank,
    String? category,
    List<String>? toppings,
  }) {
    return Product(
      name ?? this.name,
      restaurant ?? this.restaurant,
      imgurl ?? this.imgurl,
      duration ?? this.duration,
      price ?? this.price,
      rank ?? this.rank,
      category ?? this.category,
      toppings ?? this.toppings,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'restaurant': restaurant,
      'imgurl': imgurl,
      'duration': duration,
      'price': price,
      'rank': rank,
      'category': category,
      'toppings': toppings,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      map['name'],
      map['restaurant'],
      map['imgurl'],
      map['duration'],
      map['price'],
      map['rank'],
      map['category'],
      List<String>.from(map['toppings']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(name: $name, restaurant: $restaurant, imgurl: $imgurl, duration: $duration, price: $price, rank: $rank, category: $category, toppings: $toppings)';
  }
}
