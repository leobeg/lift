// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Exercise {
  final int id;
  final String name;
  final int usualSetCount;

  Exercise({required this.id, required this.name, this.usualSetCount = 3});


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id != 0 ? id : null,
      'name': name,
      'usualSetCount': usualSetCount,
    };
  }

  factory Exercise.fromMap(Map<String, dynamic> map) {
    return Exercise(
      id: map['id'] as int,
      name: map['name'] as String,
      usualSetCount: map['usualSetCount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Exercise.fromJson(String source) => Exercise.fromMap(json.decode(source) as Map<String, dynamic>);

  Exercise copyWith({
    int? id,
    String? name,
    int? usualSetCount,
  }) {
    return Exercise(
      id: id ?? this.id,
      name: name ?? this.name,
      usualSetCount: usualSetCount ?? this.usualSetCount,
    );
  }
}
