import 'dart:math' as math;
import 'package:flutter/material.dart';

import './animations_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transformations"),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Go to Animations Page",
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AnimationsPage()));
        },
        child: const Icon(Icons.play_arrow),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: 30 * (math.pi / 180),
              child: const Text("Rotate Only"),
            ),
            Transform.scale(
              scale: 0.4,
              child: Transform.translate(
                offset: const Offset(-50, 80),
                child: Transform.rotate(
                  angle: -10 * (math.pi / 180),
                  child: const Text("Scale, translate, rotate"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
