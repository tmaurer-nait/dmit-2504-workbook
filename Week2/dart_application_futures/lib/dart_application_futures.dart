import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> getJSON(String endpoint) async {
  Uri url = Uri.parse(endpoint); // Create a URI object from endpoint string
  http.Response response = await http.get(url); // Make the http request
  return jsonDecode(response.body);
}
