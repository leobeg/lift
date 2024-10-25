import 'package:lift/features/exercises/domain/entities/exercise.dart';
import 'package:lift/features/exercises/domain/entities/exercise_log.dart';

abstract class ExerciseRepo {
  Future<List<Exercise>> getExercises();
  Future<void> createExercise(Exercise exercise);
  Future<void> deleteExercise(Exercise exercise);

  Future<List<ExerciseLog>> getExerciseLogs(Exercise exercise);
  Future<void> createExerciseLog(ExerciseLog exerciseLog, int exerciseId);
  Future<void> deleteExerciseLog(ExerciseLog exerciseLog);

}