import 'package:flutter/material.dart';
import 'package:lift/features/exercises/data/local_exercise_repo.dart';
import 'package:lift/features/exercises/domain/entities/exercise.dart';
import 'package:lift/features/exercises/domain/entities/exercise_log.dart';

class ExerciseOverviewPage extends StatefulWidget {
  const ExerciseOverviewPage({super.key});

  @override
  State<ExerciseOverviewPage> createState() => _ExerciseOverviewPageState();
}

class _ExerciseOverviewPageState extends State<ExerciseOverviewPage> {
  final exerciseRepo = LocalExerciseRepo();
  List<Exercise> exercises = [];
  List<ExerciseLog> exerciseLogs = [];

  void getExercises() async {
    List<Exercise> dbExercises = await exerciseRepo.getExercises();
    setState(() {
      exercises = dbExercises;
    });
  }

  void getExerciseLogs() async {
    List<ExerciseLog> dbExercises =
        await exerciseRepo.getExerciseLogs(Exercise(id: 1, name: "name"));
    setState(() {
      exerciseLogs = dbExercises;
    });
  }

  void createExercise() async {
    await exerciseRepo.createExercise(Exercise(id: 0, name: "Split squats"));
    List<Exercise> dbExercises = await exerciseRepo.getExercises();

    setState(() {
      exercises = dbExercises;
    });
  }

  void createExerciseLog() async {
    await exerciseRepo.createExerciseLog(
        ExerciseLog(exerciseId: 1, weight: 12, reps: 12), 1);
    List<ExerciseLog> dbExercises =
        await exerciseRepo.getExerciseLogs(Exercise(id: 1, name: "name"));

    setState(() {
      exerciseLogs = dbExercises;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Page"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              getExercises();
            },
            child: Container(
              color: Colors.amber,
              padding: EdgeInsets.all(5),
              child: Text("Get Exercises"),
            ),
          ),
          GestureDetector(
            onTap: () {
              createExercise();
            },
            child: Container(
              color: Colors.amber,
              padding: EdgeInsets.all(5),
              child: Text("Create Exercise"),
            ),
          ),
          GestureDetector(
            onTap: () {
              getExerciseLogs();
            },
            child: Container(
              color: Colors.amber,
              padding: EdgeInsets.all(5),
              child: Text("Get ExerciseLogs"),
            ),
          ),
          GestureDetector(
            onTap: () {
              createExerciseLog();
            },
            child: Container(
              color: Colors.amber,
              padding: EdgeInsets.all(5),
              child: Text("Create ExerciseLogs"),
            ),
          )
        ],
      ),
    );
  }
}
