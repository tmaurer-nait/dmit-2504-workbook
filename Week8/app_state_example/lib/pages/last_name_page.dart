import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user.dart';

class LastNamePage extends ConsumerWidget {
  const LastNamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the user from the ref
    final user = ref.watch(userProvider);

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
            Text('Username: ${user.firstName} ${user.lastName}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Update our user last name here
        onPressed: () {
          user.lastName = 'UpdatedLastName';
        },
        child: const Icon(Icons.update),
      ),
    );
  }
}
