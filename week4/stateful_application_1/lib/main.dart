import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
            body: Center(
      child: RandomDogImage(),
    )));
  }
}

class RandomDogImage extends StatefulWidget {
  const RandomDogImage({super.key});

  @override
  State<RandomDogImage> createState() => _RandomDogImageState();
}

class _RandomDogImageState extends State<RandomDogImage> {
  String dogImageURL = '';

  static Future<String> getRandomUrl() async {
    const dogEndpoint = 'https://dog.ceo/api/breeds/image/random';
    var response = await get(Uri.parse(dogEndpoint));
    return await jsonDecode(response.body)["message"];
  }

  @override
  void initState() {
    super.initState();
    getRandomUrl().then((url) {
      setState(() {
        dogImageURL = url;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (dogImageURL.trim() == "")
            ? const CircularProgressIndicator()
            : Image.network(dogImageURL),
        TextButton(
            onPressed: () {
              setState(() {
                dogImageURL = '';
              });
              getRandomUrl().then((url) {
                setState(() {
                  dogImageURL = url;
                });
              });
            },
            child: const Text("Get A New Dog"))
      ],
    );
  }
}
