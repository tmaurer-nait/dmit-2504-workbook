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
        return Dismissible(
          key: UniqueKey(),
          child: ListTile(
            title: Text(
              todo.description,
              style: todo.completed
                  ? const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontStyle: FontStyle.italic)
                  : null,
            ),
            shape: const Border(
              bottom: BorderSide(color: Colors.grey),
            ),
            trailing: Checkbox(
                value: todo.completed,
                onChanged: (value) {
                  setState(() {
                    todo.completed = value!;
                    widget.appState.updateTodo(todo: todo);
                  });
                }),
          ),
          onDismissed: (direction) {
            setState(() {
              todos.removeAt(index);
              widget.appState.deleteTodo(todo: todo);
            });
          },
        );
      },
      itemCount: todos.length,
    );
  }
}
