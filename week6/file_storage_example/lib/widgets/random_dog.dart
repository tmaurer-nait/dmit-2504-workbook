import 'package:flutter/material.dart';

import 'package:http/http.dart';

import 'dart:convert';

import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

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

    // Load likes and dislikes from shared prefs
    _loadSharedPreferences();

    // Open the dog file directory
    getTemporaryDirectory().then((dir) {
      var filePath = '${dir.path}/dog.jpg';
      var file = File(filePath);

      // Check if dog image exists on disk
      if (file.existsSync()) {
        // Set the dog image url to the file path
        setState(() {
          dogImageURL = filePath;
        });
      } else {
        // otherwise show random dog from internet
        getRandomUrl().then((url) {
          setState(() {
            dogImageURL = url;
          });
        });
      }
    });
  }

  void _loadSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    var likesPref = prefs.getInt('likes') ?? 0;
    var dislikesPref = prefs.getInt('dislikes') ?? 0;

    setState(() {
      likes = likesPref;
      dislikes = dislikesPref;
    });
  }

  void _saveSharedPreferences(int likes, int dislikes) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setInt('likes', likes);
    prefs.setInt('dislikes', dislikes);
  }

  Widget _buildDogImage() {
    Widget childWidget;

    if (dogImageURL != '') {
      if (dogImageURL.startsWith('http')) {
        childWidget = Image.network(dogImageURL);
        // Save the Dog Image
        _saveImage(dogImageURL);
      } else {
        childWidget = Image.file(File(dogImageURL));
      }
    } else {
      childWidget = const CircularProgressIndicator();
    }

    return GestureDetector(
        onTap: () {
          getRandomUrl().then((url) {
            var newLikes = likes + 1;
            _saveSharedPreferences(newLikes, dislikes);

            setState(() {
              likes = newLikes;
              dogImageURL = url;
            });
          });
        },
        onLongPress: () {
          getRandomUrl().then((url) {
            var newDisLikes = dislikes + 1;
            _saveSharedPreferences(likes, newDisLikes);

            setState(() {
              dislikes = newDisLikes;
              dogImageURL = url;
            });
          });
        },
        child: childWidget);
  }

  void _saveImage(String url) {
    // save the image to a local file (temporary directory)
    getTemporaryDirectory().then((dir) {
      // create file path
      var filePath = '${dir.path}/dog.jpg';
      // open file
      var file = File(filePath);

      // get the dog image from the url
      get(Uri.parse(url)).then((response) {
        // Write the image to the file
        file.writeAsBytesSync(response.bodyBytes);
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
        _buildDogImage(),
      ],
    );
  }
}
