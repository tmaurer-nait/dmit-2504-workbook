import 'package:flutter_test/flutter_test.dart';
import '../lib/models/user.dart';

void main() {
  group('User Test', () {
    late User user;

    setUp(() {
      user = const User(name: "Tom Maurer", email: "tmaurer@nait.ca");
    });

    test(
      "User should have a name and an email",
      () {
        expect(user.name, "Tom Maurer");
        expect(user.email, "tmaurer@nait.ca");
      },
    );

    test("user.toString should return expected output", () {
      expect(user.toString(), 'name: Tom Maurer. email: tmaurer@nait.ca');
    });
  });
}
