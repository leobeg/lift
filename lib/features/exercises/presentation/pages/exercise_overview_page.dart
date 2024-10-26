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
        title: const Text("Test Page"),
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
              padding: const EdgeInsets.all(5),
              child: const Text("Get Exercises"),
            ),
          ),
          GestureDetector(
            onTap: () {
              createExercise();
            },
            child: Container(
              color: Colors.amber,
              padding: const EdgeInsets.all(5),
              child: const Text("Create Exercise"),
            ),
          ),
          GestureDetector(
            onTap: () {
              getExerciseLogs();
            },
            child: Container(
              color: Colors.amber,
              padding: const EdgeInsets.all(5),
              child: const Text("Get ExerciseLogs"),
            ),
          ),
          GestureDetector(
            onTap: () {
              createExerciseLog();
            },
            child: Container(
              color: Colors.amber,
              padding: const EdgeInsets.all(5),
              child: const Text("Create ExerciseLogs"),
            ),
          ), 
          Expanded(
            child: ListView.builder(itemCount: exercises.length, itemBuilder: (context, index) {
              final exercise = exercises[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(exercise.name, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
                            Text("Bodyweight exercise", style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.onSurfaceVariant),),
                          ],
                        ),
                        Text("${exercise.usualSetCount} sets", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),)
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Text("Log", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
                    const SizedBox(height: 5,),
                    ListView.builder(shrinkWrap: true, physics: ClampingScrollPhysics(), itemCount: 3, itemBuilder: (context, index) {
                      return Text("26.10.24: 3 sets  x  20 reps  at  25kg", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Theme.of(context).colorScheme.onSurfaceVariant),);
                    },),
                    const SizedBox(height: 5,),
                    Text("Show more...", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
                  ],
                ),
              );
            },),
          )
        ],
      ),
    );
  }
}
