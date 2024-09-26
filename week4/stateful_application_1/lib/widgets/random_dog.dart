import 'package:flutter/material.dart';

import 'package:http/http.dart';

import 'dart:convert';

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
        (dogImageURL.trim() == "")
            ? const CircularProgressIndicator()
            : GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    dogImageURL = '';
                    if (details.delta.dx > 0) {
                      likes++;
                    } else if (details.delta.dx < 0) {
                      dislikes++;
                    }
                  });
                  getRandomUrl().then((url) {
                    setState(() {
                      dogImageURL = url;
                    });
                  });
                },
                child: Image.network(dogImageURL)),
      ],
    );
  }
}
