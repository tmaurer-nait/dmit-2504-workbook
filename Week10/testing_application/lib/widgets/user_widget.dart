import 'package:flutter/material.dart';
import '../models/user.dart';

class UserWidget extends StatefulWidget {
  const UserWidget({super.key, required this.user});

  final User user;

  @override
  State<UserWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  var showInfo = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showInfo) Text('Name: ${widget.user.name}'),
        if (showInfo) Text('Email: ${widget.user.email}'),
        FloatingActionButton(
          onPressed: () {
            setState(() {
              showInfo = true;
            });
          },
          child: const Text("Show User Info"),
        )
      ],
    );
  }
}
