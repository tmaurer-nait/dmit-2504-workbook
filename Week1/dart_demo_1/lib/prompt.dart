import 'dart:io';

String promptName(String promptText) {
  stdout.write(promptText);
  return stdin.readLineSync()!;
}

int promptAge(String promptText) {
  bool isValid = false;
  late int age;
  stdout.write(promptText);
  String userInput = stdin.readLineSync()!;

  while (!isValid) {
    try {
      age = int.parse(userInput);
      isValid = true;
    } catch (e) {
      stdout.write(promptText);
      userInput = stdin.readLineSync()!;
    }
  }

  return age;
}
