import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lift/features/exercises/data/local_exercise_repo.dart';
import 'package:lift/features/exercises/presentation/pages/exercise_overview_page.dart';
import 'package:lift/themes/dark_mode.dart';
import 'package:lift/themes/light_mode.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkMode,
      home: const ExerciseOverviewPage(),
    );
  }
}
