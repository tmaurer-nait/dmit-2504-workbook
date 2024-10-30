import 'package:camera_app/photos_page.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({required this.description, super.key});

  final CameraDescription description;

  @override
  State<StatefulWidget> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController controller;
  late XFile? imageFile;

  Future<XFile?> takePicture() async {
    // Do nothing if we are already taking a picture
    if (controller.value.isTakingPicture) {
      return null;
    }

    try {
      final XFile file = await controller.takePicture();
      return file;
    } on CameraException catch (e) {
      // Try taking another picture
      // Tell the user that it failed
      // Crash the entire app
      print(e);
      return null;
    }
  }

  @override
  void initState() {
    super.initState();

    controller = CameraController(widget.description, ResolutionPreset.max);

    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        // Useful for rerendering after controller is initialized
        // Set camera presets here if desired
      });
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Reprompt for camera access
            // Shut down app
            break;
          default:
            // Handle other errors here
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(("Not ready")),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Camera Page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PhotosPage(),
                ),
              );
            },
            icon: const Icon(Icons.photo),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: CameraPreview(controller),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          takePicture().then((XFile? file) {
            if (mounted) {
              // store the file in the state
              setState(() {
                imageFile = file;
              });
              // show a message of where the file is saved
              if (file != null) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Picture saved to ${file.path}'),
                ));
              }
            }
          });
        },
        child: const Icon(Icons.camera),
      ),
    );
  }
}
