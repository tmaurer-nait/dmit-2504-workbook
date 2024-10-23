import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class LastNamePage extends StatelessWidget {
  const LastNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(builder: (context, user, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Last Name Page'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 24.0,
              ),
              ListenableBuilder(
                listenable: user,
                builder: (BuildContext context, Widget? child) {
                  return Text('Username: ${user.firstName} ${user.lastName}');
                },
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          // Update our user last name here
          onPressed: () {
            user.lastName = 'NewLastName';
          },
          child: const Icon(Icons.update),
        ),
      );
    });
  }
}
