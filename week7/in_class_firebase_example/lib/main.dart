import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:in_class_firebase_example/home_page.dart';
import 'app_state.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ApplicationState authAppState = ApplicationState();

  runApp(MyApp(authAppState: authAppState));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.authAppState, super.key});

  final ApplicationState authAppState;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final routes = {
      "/": (context) {
        return HomePage(authAppState: authAppState);
      },
      "/sign-in": (context) {
        return SignInScreen(
          actions: [
            AuthStateChangeAction((context, state) {
              final user = switch (state) {
                SignedIn state => state.user,
                UserCreated state => state.credential.user,
                _ => null
              };

              if (user == null) {
                return;
              }

              if (state is UserCreated) {
                // new user, update their display name
                user.updateDisplayName(user.email!.split("@").first);
              }

              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed("/");
            })
          ],
        );
      },
      "/profile": (context) {
        return ProfileScreen(
          actions: [
            SignedOutAction((context) {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed("/");
            })
          ],
        );
      }
    };

    return MaterialApp(
      title: 'Flutter Demo',
      routes: routes,
    );
  }
}
