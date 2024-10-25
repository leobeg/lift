import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class LiftDatabase {
  LiftDatabase._privateConstructor();
  static final LiftDatabase _liftDatabase = LiftDatabase._privateConstructor();

  factory LiftDatabase() {
    return _liftDatabase;
  }

  static Database? _database;

  Future<Database> get database async {
    if(_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = "$databasePath/lift.db";
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE exercise (
        id INTEGER PRIMARY KEY autoincrement NOT NULL,
        name TEXT NOT NULL,
        usualSetCount INT NULL
      )
   ''');

    await db.execute(''' 
    
      CREATE TABLE exerciseLog (
        id INTEGER PRIMARY KEY autoincrement NOT NULL,
        exerciseId INT NOT NULL,
        weight INT NOT NULL,
        reps   INT NOT NULL,
        form   INT NULL,
        FOREIGN KEY(exerciseId) REFERENCES exercise(id)
      ) 
      ''');
  }


}