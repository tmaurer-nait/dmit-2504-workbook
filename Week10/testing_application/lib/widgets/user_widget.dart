import 'package:flutter/material.dart';
import '../models/user.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Name: ${user.name}'),
        Text('Email: ${user.email}'),
      ],
    );
  }
}
