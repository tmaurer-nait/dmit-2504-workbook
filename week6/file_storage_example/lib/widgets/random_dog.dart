import 'package:flutter/material.dart';

import 'package:http/http.dart';

import 'dart:convert';

import 'dart:io';

class RandomDogImage extends StatefulWidget {
  const RandomDogImage({super.key});

  @override
  State<RandomDogImage> createState() => _RandomDogImageState();
}

class _RandomDogImageState extends State<RandomDogImage> {
  String dogImageURL = '';

  int likes = 0;
  int dislikes = 0;

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

  Widget _buildDogImage() {
    Widget childWidget;

    if (dogImageURL != '') {
      if (dogImageURL.startsWith('http')) {
        childWidget = Image.network(dogImageURL);
        // TODO: Save the Dog Image
      } else {
        childWidget = Image.file(File(dogImageURL));
      }
    } else {
      childWidget = const CircularProgressIndicator();
    }

    return GestureDetector(
        onTap: () {
          getRandomUrl().then((url) {
            setState(() {
              likes++;
              dogImageURL = url;
            });
          });
        },
        onLongPress: () {
          getRandomUrl().then((url) {
            setState(() {
              dislikes++;
              dogImageURL = url;
            });
          });
        },
        child: childWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Likes: $likes",
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Text(
              "Dislikes: $dislikes",
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            )
          ],
        ),
        _buildDogImage(),
      ],
    );
  }
}
