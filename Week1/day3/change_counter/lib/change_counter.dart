import 'dart:io';

/// Prompt the user for change. [Returns] List of integers for each coin they have (pennies, nickels, dimes, quarters, loonies, toonies)
///
/// Throws an [Error] if user enters a negative value or if they enter a non integer value
List<int> promptForChange() {
  List<int> output = [];
  List<String> coinTypes = [
    'pennies',
    'nickels',
    'dimes',
    'quarters',
    'loonies',
    'toonies'
  ];

  for (String coinType in coinTypes) {
    stdout.writeln('How many $coinType do you have?');
    late int coinCount;

    try {
      coinCount = int.parse(stdin.readLineSync()!);
    } catch (e) {
      throw Exception("User did not input an integer");
    }

    if (coinCount < 0) {
      throw Exception("User entered negative value for coins");
    }
    output.add(coinCount);
  }

  return output;
}

/// [Returns] the total number of cents given a list of coins (pennies, nickels, dimes, quarters, loonies, toonies)
int getTotal({required List<int> coinCounts}) {
  int total = 0;

  total += coinCounts[0];
  total += coinCounts[1] * 5;
  total += coinCounts[2] * 10;
  total += coinCounts[3] * 25;
  total += coinCounts[4] * 100;
  total += coinCounts[5] * 200;

  return total;
}
