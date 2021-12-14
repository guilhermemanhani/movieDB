import 'dart:convert';

class CastModel {
  final String name;
  final String knownForDepartment;
  CastModel({
    required this.name,
    required this.knownForDepartment,
  });

  CastModel copyWith({
    String? name,
    String? knownForDepartment,
  }) {
    return CastModel(
      name: name ?? this.name,
      knownForDepartment: knownForDepartment ?? this.knownForDepartment,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'original_name': name,
      'known_for_department': knownForDepartment,
    };
  }

  factory CastModel.fromMap(Map<String, dynamic> map) {
    return CastModel(
      name: map['original_name'] ?? '',
      knownForDepartment: map['known_for_department'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CastModel.fromJson(String source) =>
      CastModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CastModel(name: $name, knownForDepartment: $knownForDepartment)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CastModel &&
        other.name == name &&
        other.knownForDepartment == knownForDepartment;
  }

  @override
  int get hashCode => name.hashCode ^ knownForDepartment.hashCode;
}
