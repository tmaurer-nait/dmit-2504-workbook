import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  Todo({required this.description, required this.completed, this.id});

  String description;
  bool completed;
  String? id;

  factory Todo.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return Todo(
        completed: data?["completed"],
        description: data?["description"],
        id: snapshot.id);
  }

  Map<String, dynamic> toMap() {
    return {'description': description, 'completed': completed};
  }
}
