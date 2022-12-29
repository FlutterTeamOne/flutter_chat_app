import 'dart:convert';

class AttachModel {
  final int id;
  final String meta;
  AttachModel({
    required this.id,
    required this.meta,
  });

  AttachModel copyWith({
    int? id,
    String? meta,
  }) {
    return AttachModel(
      id: id ?? this.id,
      meta: meta ?? this.meta,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'attachment_id': id,
      'attachment_meta': meta,
    };
  }

  factory AttachModel.fromMap(Map<String, dynamic> map) {
    return AttachModel(
      id: map['attachment_id']?.toInt() ?? 0,
      meta: map['attachment_meta'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AttachModel.fromJson(String source) => AttachModel.fromMap(json.decode(source));

  @override
  String toString() => 'AttachModel(attachment_id: $id, attachment_meta: $meta)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AttachModel &&
      other.id == id &&
      other.meta == meta;
  }

  @override
  int get hashCode => id.hashCode ^ meta.hashCode;
}