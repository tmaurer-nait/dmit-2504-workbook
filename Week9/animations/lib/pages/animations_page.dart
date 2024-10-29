import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationsPage extends StatefulWidget {
  const AnimationsPage({super.key});

  @override
  State<AnimationsPage> createState() => _AnimationsPageState();
}

class _AnimationsPageState extends State<AnimationsPage>
    with SingleTickerProviderStateMixin {
  // required for AnimatedBuilder
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Start the animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    super.dispose();
    // clean up memory leaks
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("animations"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: _controller,
                child: const Text("Rotate Animated Builder"),
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _controller.value * 2 * (math.pi),
                    child: child,
                  );
                })
          ],
        ),
      ),
    );
  }
}
