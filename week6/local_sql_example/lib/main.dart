import 'dart:math';

import 'package:flutter/material.dart';

import '../models/dog.dart';

import '../managers/dog_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  final dogManager = DogManager.instance;
  final randomGenerator = Random();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Dog> dogs = [];
  int lastID = 0;

  @override
  void initState() {
    super.initState();
    // Load the dogs from the db on initialization
    _loadDogs();
  }

  @override
  void dispose() {
    super.dispose();
    widget.dogManager.closeDB();
  }

  Future<void> _loadDogs() async {
    try {
      // Get all dogs from the db
      widget.dogManager.getDogs().then((dbDogs) {
        // Set the state to all the dogs in the db
        setState(() {
          dogs = dbDogs;
          lastID = dbDogs.isNotEmpty ? dbDogs.last.id : 0;
        });
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _addRandomDog() async {
    try {
      var newDog = Dog(
          age: widget.randomGenerator.nextInt(17),
          id: lastID + 1,
          name: "Dog${lastID + 1}");
      await widget.dogManager.insertDog(newDog);
      _loadDogs();
    } catch (e) {
      print(e);
    }
  }

  Future<void> _removeDog(int id) async {
    try {
      await widget.dogManager.deleteDog(id);
      _loadDogs();
    } catch (e) {
      print(e);
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text("Dog List")),
        body: ListView.separated(
            itemBuilder: (context, index) {
              var dog = dogs[index];
              return ListTile(
                title: Text(
                  '${dog.name} - ${dog.age.toString()}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _removeDog(dog.id);
                },
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: dogs.length),
        floatingActionButton: FloatingActionButton(
          onPressed: _addRandomDog,
          child: const Icon(Icons.plus_one),
        ),
      ),
    );
  }
}
