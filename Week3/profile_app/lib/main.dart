import 'package:flutter/material.dart';

// Runs MyApp as the main app
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.teal,
            backgroundColor: Colors.teal,
            cardColor: Colors.pink),
        useMaterial3: true,
      ),
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
      body: Center(
        child: Column(
          children: [
            const ProfileHeader(),
            ClipOval(
                child: Image.asset(
              "assets/images/person.jpg",
              height: 250,
              width: 250,
            )),
            const Text("James Person"),
            const ProfileInfo("Role", "Developer"),
            const ProfileInfo("Team", "Front-End Main Product"),
            const ProfileInfo("Handle", "@NateAtNait"),
            const ProfileInfo("Supervisor", "Sally Anne"),
          ],
        ),
      ),
    );
    // return const Text("This is a new widget");
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          "Employee Profile",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary),
        ));
  }
}

class ProfileInfo extends StatelessWidget {
  final String label;
  final String value;

  const ProfileInfo(this.label, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$label: ',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
