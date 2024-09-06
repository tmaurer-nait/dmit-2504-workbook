import 'dart:io';

import 'package:object_problem/student.dart';

void main(List<String> arguments) {
  var newStudent = Student(firstName: 'Tom', lastName: 'Maurer', idNumber: 1);

  stdout.writeln('Welcome ${newStudent.fullName}');
}
