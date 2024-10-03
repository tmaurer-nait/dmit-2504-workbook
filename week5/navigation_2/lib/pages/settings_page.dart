import 'package:flutter/material.dart';
import 'package:navigation_2/pages/settings/routes.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Settings Page")),
        body: Center(
          child: Column(
            children: [
              const Text("Settings Page"),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(settingsOption1Route);
                  },
                  child: const Text("Go to Option 1")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(settingsOption2Route);
                  },
                  child: const Text("Go to Option 2")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(settingsOption3Route);
                  },
                  child: const Text("Go to Option 3"))
            ],
          ),
        ));
  }
}
