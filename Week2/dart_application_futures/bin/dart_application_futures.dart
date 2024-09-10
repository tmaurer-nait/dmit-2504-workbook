import 'dart:convert';

import 'package:dart_application_futures/match.dart';
import 'package:dart_application_futures/dart_application_futures.dart'
    as dart_application_futures;

void main(List<String> arguments) async {
  // Wait for the getJson to resolve after fetching from the endpoint
  var data = await dart_application_futures
      .getJSON('https://dog.ceo/api/breeds/image/random');

  // Parse out the data using data['property_name'] syntax
  print('Message: ${data['message']}, Status: ${data['status']}');

  // a representation of a match as a json string
  String jsonStringMatch =
      '{"team_1_name": "Panthers", "team_2_name": "Tigers", "score_one": 100, "score_two": 10}';
  dynamic matchDetails =
      jsonDecode(jsonStringMatch); // decoding the match into a dynamic object
  print(matchDetails[
      'team_1_name']); // Parse out the data using data['property_name'] syntax

  Match theMatch = Match.fromJSON(
      matchDetails); // Using the match factory to turn dynamic object into Match class
  print(theMatch.team1Name); // Parse out the data using data.propertyName syntax
}
