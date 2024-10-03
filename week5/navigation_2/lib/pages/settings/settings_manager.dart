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
        appBar: AppBar(),
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
}
