import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state/user_cubit.dart';
import 'pages/home_page.dart';

void main() {
  // Wrap the MainApp in our ChangeNotifierProvider, which
  // will provide access to our User state object in the
  // Widget tree

  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: const MaterialApp(
        home: Scaffold(
          body: Center(
            child: HomePage(),
          ),
        ),
      ),
    );
  }
}
