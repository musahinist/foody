import 'dart:convert';

class Temp {
  String name;
  Temp({
    required this.name,
  });

  Temp copyWith({
    String? name,
  }) {
    return Temp(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory Temp.fromMap(Map<String, dynamic> map) {
    return Temp(
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Temp.fromJson(String source) => Temp.fromMap(json.decode(source));

  @override
  String toString() => 'Temp(name: $name)';
}
