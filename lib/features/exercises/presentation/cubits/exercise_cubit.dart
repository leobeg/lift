import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lift/features/exercises/domain/entities/exercise.dart';
import 'package:lift/features/exercises/domain/entities/exercise_log.dart';
import 'package:lift/features/exercises/domain/repos/exercise_repo.dart';
import 'package:lift/features/exercises/presentation/cubits/exercise_states.dart';

class ExerciseCubit extends Cubit<ExerciseState> {
  final ExerciseRepo exerciseRepo;

  ExerciseCubit({required this.exerciseRepo}) : super(ExercisesInitial());

  Future<void> getExercises() async {
    emit(ExerciseLogsLoading());
    List<Exercise> exercies = await exerciseRepo.getExercises();
    emit(ExercisesLoaded(exercies));
  }

  Future<void> getExerciseLogs(Exercise exercise) async {
    emit(ExerciseLogsLoading());
    List<ExerciseLog> exerciseLogs =
        await exerciseRepo.getExerciseLogs(exercise);
    emit(ExerciseLogsLoaded(exerciseLogs));
  }

  Future<void> createExercise(Exercise exercise) async {
    emit(ExerciseCreating());
    await exerciseRepo.createExercise(exercise);
    emit(ExerciseCreated());
  }

  // TODO: Remove test function
  Future<void> createExerciseLog(ExerciseLog exerciseLog, Exercise exercise) async {
    await exerciseRepo.createExerciseLog(exerciseLog, exercise.id);
  }
}
