import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  // This is not using named routes
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text("Page Two"),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop('Left Page Two');
              },
              child: const Text("Go Back"))
        ],
      ),
    );
  }

  // Don't push named because I want to go back and not just add to the stack
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(),
  //     body: Column(
  //       children: [
  //         const Text("Page Two"),
  //         ElevatedButton(
  //             onPressed: () {
  //               Navigator.of(context).pushNamed('/');
  //             },
  //             child: const Text("Go Back"))
  //       ],
  //     ),
  //   );
  // }
}
