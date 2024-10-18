import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:flutter/material.dart';

import '../models/todo.dart';

import 'firebase_options.dart';

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;

  User? _user;
  User? get user => _user;
  set user(User? user) {
    if (user == null) {
      throw ArgumentError('Cannot set the user to null');
    }
    _user = user;
  }

  // Track the todos (get, set)
  List<Todo>? _todos;

  List<Todo>? get todos {
    // Only allow get of this if the user is logged in and exists
    if (user == null) {
      throw StateError("Cannot get todos when user is null");
    }
    return _todos;
  }

  set todos(List<Todo>? todos) {
    // User can't be null
    if (user == null) {
      throw StateError("Cannot set todos when user is null");
    }
    // Todos can't be null
    if (todos == null) {
      throw ArgumentError("Cannot set todos to null");
    }

    _todos = todos;
  }

  // fetch todos helper function
  void _fetchTodos() {
    if (user == null) {
      throw StateError("Cannot fetch todos when user is null");
    }

    // Get todos from firestore
    FirebaseFirestore.instance
        .collection("/todos/${user!.uid}/todos")
        .get()
        .then((snapshot) {
      todos = snapshot.docs.map((doc) {
        return Todo.fromFirestore(doc);
      }).toList();
    });
  }

  // Update todos
  void updateTodo({required Todo todo}) {
    if (user == null) {
      throw StateError("Cannot update todos when user is null");
    }

    FirebaseFirestore.instance
        .collection("/todos/${user!.uid}/todos")
        .doc(todo.id)
        .update(todo.toMap());
  }

  // delete todos
  void deleteTodo({required Todo todo}) {
    if (user == null) {
      throw StateError("Cannot update todos when user is null");
    }

    FirebaseFirestore.instance
        .collection("/todos/${user!.uid}/todos")
        .doc(todo.id)
        .delete()
        .then((_) {
      _todos!.remove(todo);
    });
  }

  // TODO: insert todos

  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseUIAuth.configureProviders([
      EmailAuthProvider(),
    ]);

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loggedIn = true;

        // Update the app state to store user info
        this.user = user;

        // Fetch the todos when logged in
        _fetchTodos();
      } else {
        _loggedIn = false;
      }
      notifyListeners();
    });
  }
}
