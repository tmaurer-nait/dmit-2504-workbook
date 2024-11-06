import 'package:flutter/material.dart';
import './models/user.dart';
import './widgets/user_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Testing Demo',
      home: Scaffold(
        body: Center(
          child: UserWidget(
            user: User(
              name: "Tom Maurer",
              email: "tmaurer@nait.ca",
            ),
          ),
        ),
      ),
    );
  }
}
