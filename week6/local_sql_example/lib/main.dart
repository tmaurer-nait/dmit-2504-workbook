import 'package:flutter/material.dart';

import '../models/dog.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<Database> _connectToDB() async {
    var dbPath = await getDatabasesPath();
    // THis is one less stable way to make a path
    // var path = '$dbPath/doggie_database.db';

    // More stable way
    var path = join(dbPath, 'doggie_database.db');
    final database = openDatabase(path, onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
      );
    }, version: 1);

    return database;
  }

  Future<void> insertDog(Dog dog) async {
    final db = await _connectToDB();

    await db.insert('dogs', dog.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Dog>> getDogs() async {
    final db = await _connectToDB();

    final List<Map<String, Object?>> dogMaps = await db.query('dogs');

    // Option 1 for generating a list
    // return List.generate(dogMaps.length, (i) {
    //   return Dog.fromMap(dogMaps[i]);
    // });

    // Option 2
    return [for (final dogMap in dogMaps) Dog.fromMap(dogMap)];
  }

  Future<void> updateDog(Dog dog) async {
    final db = await _connectToDB();

    await db.update('dogs', dog.toMap(), where: 'id = ?', whereArgs: [dog.id]);
  }

  Future<void> deleteDog(int id) async {
    final db = await _connectToDB();

    await db.delete('dogs', where: 'id = ?', whereArgs: [id]);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Text("This will be the contacts app"),
    );
  }
}
