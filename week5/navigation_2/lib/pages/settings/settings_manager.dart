import 'package:flutter/material.dart';
import 'package:navigation_2/pages/settings/option1_page.dart';
import 'package:navigation_2/pages/settings/option2_page.dart';
import 'package:navigation_2/pages/settings/option3_page.dart';
import 'package:navigation_2/pages/settings_page.dart';
import 'package:navigation_2/pages/settings/routes.dart';

class SettingsManager extends StatefulWidget {
  final String optionPageRoute;

  const SettingsManager({required this.optionPageRoute, super.key});

  @override
  State<SettingsManager> createState() => _SettingsManagerState();
}

class _SettingsManagerState extends State<SettingsManager> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(), // back button is here
        body: Navigator(
          key: _navigatorKey,
          initialRoute: widget.optionPageRoute,
          onGenerateRoute: _onGenerateRoute,
        ));
  }

  Route _onGenerateRoute(RouteSettings settings) {
    Widget page = const SizedBox.shrink();

    switch (settings.name) {
      case settingsHomeRoute:
        page = const SettingsPage();
        break;
      case settingsOption1Route:
        page = const Option1();
        break;
      case settingsOption2Route:
        page = const Option2();
        break;
      case settingsOption3Route:
        page = const Option3();
        break;
    }

    return MaterialPageRoute(
        builder: (context) {
          return page;
        },
        settings: settings);
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('App Settings'),
      leading: IconButton(
          onPressed: () {
            if (_navigatorKey.currentState!.canPop()) {
              _navigatorKey.currentState!.pop();
            } else {
              Navigator.of(context).pop();
            }
          },
          icon: const Icon(Icons.arrow_back)),
    );
  }
}
