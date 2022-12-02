import 'model.dart';

class User extends Model {
  static const table = 'User';

  final int? id;
  final String name;

  User({
    this.id,
    required this.name,
  });

  static User fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'id': id,
      'name': name,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
}
