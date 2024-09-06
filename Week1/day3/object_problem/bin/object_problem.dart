import 'dart:io';

import 'package:object_problem/roster_options.dart' as roster_functions;
import 'package:object_problem/student.dart';

void main(List<String> arguments) {
  late String userInput;

  List<Student> roster = [];

  do {
    stdout.writeln(
        'What would you like to do? x to exit, a to add a student, v to view the roster');
    userInput = stdin.readLineSync()!;

    switch (userInput) {
      case 'x':
        break;
      case 'a':
        if (roster.length >= 2) {
          stdout.writeln(
              'Sorry your class is full, you cannot add further students');
        } else {
          roster_functions.addStudentToRoster(roster);
        }
        break;
      case 'v':
        roster_functions.listRoster(roster);
        break;
      default:
        stdout.writeln('That is not a valid option. Please enter x, a, or v');
    }
  } while (userInput != 'x');
}
