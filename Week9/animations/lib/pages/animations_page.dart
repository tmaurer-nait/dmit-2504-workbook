import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:async';

class AnimationsPage extends StatefulWidget {
  const AnimationsPage({super.key});

  @override
  State<AnimationsPage> createState() => _AnimationsPageState();
}

class _AnimationsPageState extends State<AnimationsPage>
    with SingleTickerProviderStateMixin {
  // required for AnimatedBuilder
  late final AnimationController _controller;

  // Required for TweenAnimationBuilder
  int _tweenValue = 0;
  late Timer _tweenTimer;

  @override
  void initState() {
    super.initState();

    // Start the animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    // Start the tween animation
    _tweenTimer = Timer.periodic(
      const Duration(milliseconds: 30),
      (timer) {
        setState(() {
          _tweenValue = _tweenValue == 1000 ? 1 : _tweenValue + 1;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    // clean up memory leaks
    _controller.dispose();
    _tweenTimer.cancel();
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
                }),
            const SizedBox(height: 110),
            TweenAnimationBuilder(
                tween: IntTween(begin: 0, end: _tweenValue),
                duration: const Duration(milliseconds: 30),
                builder: (context, value, widget) {
                  return Transform.rotate(
                    angle: value / 100 * (2 * math.pi),
                    child: const Text("Tween Builder Rotation"),
                  );
                }),
            const SizedBox(height: 110),
            RotationTransition(
              // turns: _controller,
              turns: CurvedAnimation(
                parent: _controller,
                curve: Curves.easeInCubic,
              ),
              child: const Text("rotation Transition"),
            )
          ],
        ),
      ),
    );
  }
}
