import 'dart:convert';

class User {
  final int id;
  final String name;
  final String email;
  final String profilePicId;
  final DateTime accountCreated;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.profilePicId,
    required this.accountCreated,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profilePicId': profilePicId,
      'accountCreated': accountCreated.millisecondsSinceEpoch,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      profilePicId: map['profilePicId'] ?? '',
      accountCreated: DateTime.fromMillisecondsSinceEpoch(map['accountCreated']),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
