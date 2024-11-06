import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:testing_application/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("end-to-end app tests", () {
    testWidgets(
      "tap on the FAB, verify name and email",
      (tester) async {
        // load the app widget
        await tester.pumpWidget(const MyApp());

        expect(find.text("Name: Tom Maurer"), findsNothing);
        expect(find.text("Email: tmaurer@nait.ca"), findsNothing);

        final fab = find.byType(FloatingActionButton);

        await tester.tap(fab);

        await tester.pumpAndSettle();

        expect(find.text("Name: Tom Maurer"), findsOneWidget);
        expect(find.text("Email: tmaurer@nait.ca"), findsOneWidget);
      },
    );
  });
}
