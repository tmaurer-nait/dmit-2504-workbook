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
      ),
    );
  }
}
