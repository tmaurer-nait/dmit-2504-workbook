import 'package:flutter/material.dart';
import 'package:profile_app/widgets/profile_header.dart';
import 'package:profile_app/widgets/profile_image.dart';
import 'package:profile_app/widgets/profile_info.dart';

// Runs MyApp as the main app
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData darkTheme = ThemeData.dark();
    final ThemeData lightTheme = ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.orange,
            backgroundColor: Colors.teal,
            cardColor: Colors.blue));

    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // This is our constructor
  const MyHomePage({super.key});

  // typed b then tab to insert build widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "This is my profile App",
          style: TextStyle(fontSize: 36),
        ),
      ),
      body: const Center(
        child: Column(
          children: [
            ProfileHeader(),
            ProfileImage('assets/images/person.jpg'),
            Text('James Person'),
            ProfileInfo('Role', 'Developer'),
            ProfileInfo('Team', 'Front-End Main Product'),
            ProfileInfo('Handle', '@NateAtNait'),
            ProfileInfo('Supervisor', 'Sally Anne'),
          ],
        ),
      ),
    );
    // return const Text("This is a new widget");
  }
}
