import 'dart:io';

import 'package:object_problem/student.dart';

void addStudentToRoster(List<Student> currentRoster) {
  stdout.writeln('Please Enter the students first name');
  String firstName = stdin.readLineSync()!;

  stdout.writeln('Please Enter the students last name');
  String lastName = stdin.readLineSync()!;

  try {
    var newStudent = Student(
        firstName: firstName,
        lastName: lastName,
        idNumber: currentRoster.length + 1);
    currentRoster.add(newStudent);
  } catch (e) {
    stdout.writeln('something went wrong. Student could not be added');
  }
}

void listRoster(List<Student> currentRoster) {
  stdout.writeln('Id    Last Name    First Name');
  stdout.writeln('--    ---------    ----------');
  for (var student in currentRoster) {
    // To make everything line up nicely I used string.padright() check here: https://api.flutter.dev/flutter/dart-core/String/padRight.html for details
    stdout.writeln(
        '${student.idNumber.toString().padRight(2)}    ${student.lastName.padRight(9)}    ${student.firstName.padRight(10)}');
  }
}
