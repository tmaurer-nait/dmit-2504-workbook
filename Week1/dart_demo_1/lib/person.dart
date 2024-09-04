class Person {
  late String _name;
  late int _age;

  Person(String name, int age) {
    this.name = name;
    this.age = age;
  }

  String get name {
    return this._name;
  }

  set name(String value) {
    if (value.length < 3) {
      throw Exception('Name must be at least 3 characters');
    }
    this._name = value;
  }

  int get age {
    return this._age;
  }

  set age(int value) {
    if (value < 0) {
      throw Exception('Age must be greater than or equal to zero');
    }

    this._age = value;
  }
}
