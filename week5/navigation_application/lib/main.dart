import 'package:flutter/material.dart';
import 'package:navigation_application/pages/page_one.dart';
import 'package:navigation_application/pages/page_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const PageOne(),
        '/page-two': (context) => const PageTwo()
      },
    );
  }
}
