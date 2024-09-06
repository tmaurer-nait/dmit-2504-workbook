class Student {
  late String _firstName;
  late String _lastName;
  late int _idNumber;

  Student(
      {required String firstName,
      required String lastName,
      required int idNumber}) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.idNumber = idNumber;
  }

  Student.emptyStudent() {
    this._firstName = "";
    this._lastName = "";
    this._idNumber = 0;
  }

  set firstName(String value) {
    if (value.isEmpty) {
      throw Exception("First name must be at least 1 character");
    }

    this._firstName = value;
  }

  String get firstName {
    return this._firstName;
  }

  set lastName(String value) {
    if (value.isEmpty) {
      throw Exception("Last name must be at least 1 character");
    }

    this._lastName = value;
  }

  String get lastName {
    return this._lastName;
  }

  set idNumber(int value) {
    if (value < 0) {
      throw Exception("ID numbers must be positive");
    }

    this._idNumber = value;
  }

  int get idNumber {
    return this._idNumber;
  }

  String get fullName {
    return '${this._lastName}, ${this._firstName}';
  }
}
