import 'dart:convert';

class CurrentUser {
  String name;
  String email;
  String imgurl;
  String phone;
  List favorites;
  List basket;
  CurrentUser({
    required this.name,
    required this.email,
    required this.imgurl,
    required this.phone,
    required this.favorites,
    required this.basket,
  });

  CurrentUser copyWith({
    String? name,
    String? email,
    String? imgurl,
    String? phone,
    List? favorites,
    List? basket,
  }) {
    return CurrentUser(
      name: name ?? this.name,
      email: email ?? this.email,
      imgurl: imgurl ?? this.imgurl,
      phone: phone ?? this.phone,
      favorites: favorites ?? this.favorites,
      basket: basket ?? this.basket,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'imgurl': imgurl,
      'phone': phone,
      'favorites': favorites,
      'basket': basket,
    };
  }

  factory CurrentUser.fromMap(Map<String, dynamic> map) {
    return CurrentUser(
      name: map['name'],
      email: map['email'],
      imgurl: map['imgurl'],
      phone: map['phone'],
      favorites: List.from(map['favorites']),
      basket: List.from(map['basket']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentUser.fromJson(String source) =>
      CurrentUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CurrentUser(name: $name, email: $email, imgurl: $imgurl, phone: $phone, favorites: $favorites, basket: $basket)';
  }
}
