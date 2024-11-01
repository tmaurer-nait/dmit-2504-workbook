import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Position? _position;
  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();
    _position = null;
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check that location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location service is disabled on this device");
    }

    // Check that we have all necessary permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // If we don't have permission ask for permission
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // If we don't get permission return an error
        return Future.error('Location permissions are denied');
        // Here you could ask again, show UI explaining the issues, stop doing location things etc.
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permissions are permanently denied");
    }

    // Return position
    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.best),
    );
  }

  void _handlePress() async {
    try {
      final position = await _determinePosition();
      setState(() {
        _position = position;
      });
    } catch (e) {
      // If we don't have permissions set position to null
      setState(() {
        _position = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(children: [
              Text('Location: ${_position ?? "unknown"}'),
              ElevatedButton(
                onPressed: _handlePress,
                child: const Text("Get Position"),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
