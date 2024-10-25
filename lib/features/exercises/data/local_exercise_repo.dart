import 'package:lift/features/exercises/domain/entities/exercise.dart';
import 'package:lift/features/exercises/domain/entities/exercise_log.dart';
import 'package:lift/features/exercises/domain/repos/exercise_repo.dart';
import 'package:lift/global/database.dart';

class LocalExerciseRepo implements ExerciseRepo {

  LiftDatabase database = LiftDatabase();


  @override
  Future<void> createExercise(Exercise exercise) async {
    final db = await database.database;
    await db.insert('exercise', exercise.toMap());
  }

  @override
  Future<void> createExerciseLog(ExerciseLog exerciseLog, int exerciseId) async {
    final exerciseLogInsert = exerciseLog.copyWith(exerciseId: exerciseId);
    final db = await database.database;
    await db.insert('exerciseLog', exerciseLogInsert.toMap());
  }

  @override
  Future<void> deleteExercise(Exercise exercise) {
    // TODO: implement deleteExercise
    throw UnimplementedError();
  }

  @override
  Future<void> deleteExerciseLog(ExerciseLog exerciseLog) {
    // TODO: implement deleteExerciseLog
    throw UnimplementedError();
  }

  @override
  Future<List<ExerciseLog>> getExerciseLogs(Exercise exercise) async {
    final db = await database.database;
    final result = await db.query("exerciseLog", where: "exerciseId = ?", whereArgs: [exercise.id]);
    return result.map((json) => ExerciseLog.fromMap(json)).toList();
  }

  @override
  Future<List<Exercise>> getExercises() async {
    final db = await database.database;
    final result = await db.query("exercise");
    return result.map((json) => Exercise.fromMap(json)).toList();
  }

}