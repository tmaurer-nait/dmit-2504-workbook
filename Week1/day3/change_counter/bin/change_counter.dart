import 'dart:io';
import 'package:change_counter/change_counter.dart' as change_counter;

void main(List<String> arguments) {
  List<int> coinsInPocket = change_counter.promptForChange();
  var total = change_counter.getTotal(coinCounts: coinsInPocket);

  stdout.writeln('Your total change is worth: \$${total / 100}');
}
