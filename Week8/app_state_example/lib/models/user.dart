import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  User(String firstName, String lastName) {
    this.firstName = firstName;
    this.lastName = lastName;
  }

  String? _firstName;
  String? _lastName;

  String? get firstName => _firstName;
  String? get lastName => _lastName;

  set firstName(newFirstName) {
    _firstName = newFirstName;

    // Notify any listeners of changes to our user state
    notifyListeners();
  }

  set lastName(newLastName) {
    _lastName = newLastName;

    // Notify any listeners of changes to our user state
    notifyListeners();
  }
}
