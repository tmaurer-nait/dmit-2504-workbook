import "../models/dog.dart";

import "package:sqflite/sqflite.dart";
import "package:path/path.dart";

class DogManager {
  const DogManager._();

  static const _dbName = "dogs.db";
  static const _dbVersion = 1;

  static const DogManager instance = DogManager._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _connectToDB();
    return _database!;
  }

  Future<Database> _connectToDB() async {
    var dbPath = await getDatabasesPath();
    // THis is one less stable way to make a path
    // var path = '$dbPath/doggie_database.db';

    // More stable way
    var path = join(dbPath, _dbName);
    final database = openDatabase(path, onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
      );
    }, version: _dbVersion);

    return database;
  }

  Future<void> closeDB() async {
    final db = await database;
    db.close();
  }

  Future<void> insertDog(Dog dog) async {
    final db = await database;

    await db.insert('dogs', dog.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Dog>> getDogs() async {
    final db = await database;

    final List<Map<String, Object?>> dogMaps = await db.query('dogs');

    // Option 1 for generating a list
    // return List.generate(dogMaps.length, (i) {
    //   return Dog.fromMap(dogMaps[i]);
    // });

    // Option 2
    return [for (final dogMap in dogMaps) Dog.fromMap(dogMap)];
  }

  Future<void> updateDog(Dog dog) async {
    final db = await database;

    await db.update('dogs', dog.toMap(), where: 'id = ?', whereArgs: [dog.id]);
  }

  Future<void> deleteDog(int id) async {
    final db = await database;

    await db.delete('dogs', where: 'id = ?', whereArgs: [id]);
  }
}
