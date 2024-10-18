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
    super.initState();
    // Initialize the todos to something
    setState(() {
      _todoList = widget.appState.todos!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      body: _buildList(_todoList),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Text("FIX ME"),
      ),
    );
  }

  Widget _buildList(List<Todo> todos) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final todo = todos[index];
        // TODO: Wrap in dismissable
        return ListTile(
          // TODO: Style this text
          title: Text(todo.description),
          shape: const Border(
            bottom: BorderSide(color: Colors.grey),
          ),
          trailing: Checkbox(
              value: todo.completed,
              onChanged: (value) {
                todo.completed = value!;
                //TODO connect to appState
              }),
        );
      },
      itemCount: todos.length,
    );
  }
}
