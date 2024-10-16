import 'package:flutter/material.dart';
import './models/todo.dart';

import 'app_state.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({required this.appState, super.key});

  final ApplicationState appState;

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Todo> _todoList = [];

  @override
  void initState() {
    // TODO: Initialize the todos to something
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      body: const Text("REPLACE ME WITH THE TODO LIST"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Text("FIX ME"),
      ),
    );
  }
}
