import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lift/features/exercises/data/local_exercise_repo.dart';
import 'package:lift/features/exercises/presentation/pages/exercise_overview_page.dart';
import 'package:lift/themes/light_mode.dart';

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ExerciseOverviewPage(),
    );
  }
}
