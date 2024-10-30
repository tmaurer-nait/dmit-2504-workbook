import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import './camera_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  List<CameraDescription> cameras = await availableCameras();

  runApp(MyApp(
    description: cameras[0],
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.description, super.key});

  final CameraDescription description;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera Application',
      home: CameraPage(
        description: description,
      ),
    );
  }
}
