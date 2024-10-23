import '../models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirstNamePage extends ConsumerWidget {
  const FirstNamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Use the ref to listen to changes to the user state
    final user = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('First Name Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 24.0,
            ),
            Text('UserName: ${user.firstName} ${user.lastName}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Update our user firs name here
        onPressed: () {
          user.firstName = 'UpdatedFirstName';
        },
        child: const Icon(Icons.update),
      ),
    );
  }
}
