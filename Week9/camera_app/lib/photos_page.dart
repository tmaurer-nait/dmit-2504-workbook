import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({super.key});

  @override
  State<StatefulWidget> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  var photosDir = '';
  List<String> photosList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApplicationCacheDirectory().then((dir) {
      setState(() {
        // save the photos dir to state
        photosDir = dir.path;
        // get all photo paths in that directory
        dir.listSync().toList().forEach((file) {
          if (file.path.endsWith('jpg')) photosList.add(file.path);
        });
        // Save all the photo paths to state
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Photos Page'),
      ),
      body: Center(
          child: Column(
        children: [
          photosList.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: photosList.length,
                    itemBuilder: (context, idx) {
                      return ListTile(
                        leading: Image.file(
                          File(photosList[idx]),
                          width: 36,
                          height: 36,
                        ),
                        title: Text(photosList[idx]),
                      );
                    },
                  ),
                )
              : const Text('No saved photos'),
        ],
      )),
    );
  }
}
