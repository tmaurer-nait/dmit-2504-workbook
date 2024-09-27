import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text("User Signup Form")),
            body: const Padding(
                padding: EdgeInsets.all(16.0), child: UserSignupForm())));
  }
}

class UserSignupForm extends StatelessWidget {
  const UserSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const Text("New User Form"),
          TextFormField(
            decoration: const InputDecoration(label: Text("username")),
          ), // UserName Input
          TextFormField(
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(label: Text("password")),
          ), // Password Input
          ElevatedButton(
              onPressed: () => false, // Placeholder function
              child: const Text("Sign Up")) // Signup Button
        ],
      ),
    );
  }
}
