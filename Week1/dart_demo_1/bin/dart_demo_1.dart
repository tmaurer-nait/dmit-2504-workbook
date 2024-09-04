import 'dart:io';

import 'package:dart_demo_1/prompt.dart' as prompt;
import 'package:dart_demo_1/person.dart';

void main(List<String> arguments) {
  String name = prompt.promptName('What is your name? ');
  int age = prompt.promptAge('What is your age? Please enter a valid number ');
  Person newPerson = Person(name, age);
  stdout.writeln('Hello ${newPerson.name}, ${newPerson.age}! Welcome to NAIT');
}
