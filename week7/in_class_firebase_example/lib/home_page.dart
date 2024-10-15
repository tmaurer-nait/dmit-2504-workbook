import 'package:flutter/material.dart';
import 'app_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.authAppState, super.key});

  final ApplicationState authAppState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Firebase Auth Demo")),
      body: ListView(
        children: [
          const SizedBox(height: 16.0),
          ListenableBuilder(
              listenable: authAppState,
              builder: (context, child) {
                return authAppState.loggedIn
                    ? ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/profile");
                        },
                        child: const Text("Profile"))
                    : ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/sign-in");
                        },
                        child: const Text("Sign in"));
              })
        ],
      ),
    );
  }
}
