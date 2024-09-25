import 'package:flutter/material.dart';

import 'package:stateful_application_1/widgets/random_dog.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
            body: Center(
      child: RandomDogImage(),
    )));
  }
}
