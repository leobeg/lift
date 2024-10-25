

import 'package:lift/features/exercises/domain/entities/exercise.dart';
import 'package:lift/features/exercises/domain/entities/exercise_log.dart';

abstract class ExerciseState {}

class ExercisesInitial extends ExerciseState {}

class ExercisesLoading extends ExerciseState {}

class ExercisesLoaded extends ExerciseState {
  final List<Exercise> exercies;
  ExercisesLoaded(this.exercies);
}

class ExerciseLogsLoading extends ExerciseState {}

class ExerciseLogsLoaded extends ExerciseState {
  final List<ExerciseLog> exercieLogs;
  ExerciseLogsLoaded(this.exercieLogs);
}

class ExerciseCreating extends ExerciseState {}

class ExerciseCreated extends ExerciseState {}

class ExerciseError extends ExerciseState {}