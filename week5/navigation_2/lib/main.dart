import 'package:flutter/material.dart';
import 'package:navigation_2/pages/home_page.dart';
import 'package:navigation_2/routes.dart';
import 'package:navigation_2/pages/settings/settings_manager.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) {
        Widget page;

        switch (settings.name) {
          case homeRoute:
            page = const HomePage();
            break;
          case settingsHomeRoute:
            page = SettingsManager(
              optionPageRoute: settings.name!.substring(10),
            );
            break;
          default:
            throw Exception("Unknown route used: ${settings.name}");
        }

        return MaterialPageRoute(
            builder: (context) => page, settings: settings);
      },
    );
  }
}
