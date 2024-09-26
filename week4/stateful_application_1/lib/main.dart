import 'package:flutter/material.dart';

import 'package:stateful_application_1/widgets/random_dog.dart';
import 'package:stateful_application_1/widgets/page_title.dart';

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
      child: Column(
        children: [
          PageTitle("Do you like this Dog?"),
          RandomDogImage(),
        ],
      ),
    )));
  }
}
