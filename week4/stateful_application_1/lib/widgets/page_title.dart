import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String _title;

  const PageTitle(this._title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          _title,
          style: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
        ));
  }
}
