class Dog {
  final int id;
  final String name;
  final int age;

  const Dog({required this.id, required this.name, required this.age});

  factory Dog.fromMap(Map<String, Object?> dogMap) {
    return Dog(
        age: dogMap['age'] as int,
        name: dogMap['name'] as String,
        id: dogMap['id'] as int);
  }

  Map<String, Object?> toMap() {
    return {'id': id, 'name': name, 'age': age};
  }
}
