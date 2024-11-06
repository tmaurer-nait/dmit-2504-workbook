import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/models/user.dart';
import '../lib/widgets/user_widget.dart';

void main() {
  late User user;
  late Widget app;

  setUp(() {
    user = const User(name: "Tom Maurer", email: "tmaurer@nait.ca");
    app = MaterialApp(
      home: Scaffold(
        body: UserWidget(user: user),
      ),
    );
  });

  testWidgets("UserWidget should display name and email when button pressed",
      (WidgetTester tester) async {
    // Render the widget to the build context
    await tester.pumpWidget(app);

    // Create the finders
    final nameFinder = find.text("Name: ${user.name}");
    final emailFinder = find.text("Email: tmaurer@nait.ca");
    final fabFinder = find.byType(FloatingActionButton);

    // On Initial render the text should not be visible
    expect(nameFinder, findsNothing);
    expect(emailFinder, findsNothing);

    // press the button
    await tester.tap(fabFinder);

    // Pump to rerender the UI
    await tester.pump(const Duration(seconds: 1));

    expect(nameFinder, findsOneWidget);
    expect(emailFinder, findsOneWidget);
  });
}
