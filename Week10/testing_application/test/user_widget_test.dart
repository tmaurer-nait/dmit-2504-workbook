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

  testWidgets("UserWidget should display name and email",
      (WidgetTester tester) async {
    // Render the widget to the build context
    await tester.pumpWidget(app);

    // Create the finders
    final nameFinder = find.text("Name: ${user.name}");
    final emailFinder = find.text("Email: tmaurer@nait.ca");

    // Assertions
    expect(nameFinder, findsOneWidget);
    expect(emailFinder, findsOneWidget);
  });
}
