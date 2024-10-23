import '../models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';

void main() {
  // Wrap the MainApp in our ChangeNotifierProvider, which
  // will provide access to our User state object in the
  // Widget tree

  runApp(ChangeNotifierProvider(
    create: (context) => User('James', 'Dean'),
    child: const MainApp(),
  ));
}

User user = User('John', 'Day');

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: HomePage(),
        ),
      ),
    );
  }
}
