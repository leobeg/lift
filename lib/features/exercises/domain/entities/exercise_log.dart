// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ExerciseLog {
  final int exerciseId;
  final int weight;
  final int reps;
  int? form;

  ExerciseLog({required this.exerciseId, required this.weight, required this.reps, this.form});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'exerciseId': exerciseId,
      'weight' : weight,
      'reps': reps,
      'form': form,
    };
  }

  factory ExerciseLog.fromMap(Map<String, dynamic> map) {
    return ExerciseLog(
      exerciseId: map['exerciseId'] as int,
      weight: map['weight'] as int,
      reps: map['reps'] as int,
      form: map['form'] != null ? map['form'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExerciseLog.fromJson(String source) => ExerciseLog.fromMap(json.decode(source) as Map<String, dynamic>);

  ExerciseLog copyWith({
    int? exerciseId,
    int? weight,
    int? reps,
    int? form,
  }) {
    return ExerciseLog(
      exerciseId: exerciseId ?? this.exerciseId,
      weight: weight ?? this.weight,
      reps: reps ?? this.reps,
      form: form ?? this.form,
    );
  }
}
