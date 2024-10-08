import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _darkMode = false;

  Future<bool> _readDarkModeFromSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('darkMode') ?? false;
  }

  @override
  void initState() {
    super.initState();
    _readDarkModeFromSharedPrefs().then((isDarkMode) {
      setState(() {
        _darkMode = isDarkMode;
      });
    });
  }

  SwitchListTile _buidDarkModeSwitch() {
    return SwitchListTile(
        title: const Text('Dark Mode'),
        value: _darkMode,
        onChanged: (value) async {
          setState(() {
            _darkMode = value;
          });
          // save the darkmode property to the shared preferences
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool('darkMode', value);
        });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: _darkMode ? ThemeData.dark() : ThemeData.light(),
        home: Scaffold(
            appBar: AppBar(title: const Text('Shared Prefs Demo')),
            body: Center(
              child: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                _buidDarkModeSwitch(),
                const SizedBox(height: 20),
                Text(_darkMode ? 'Dark Mode is ON' : 'Dark Mode is OFF')
              ]),
            )));
  }
}
