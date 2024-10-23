import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/user_cubit.dart';

import '../models/user.dart';

class LastNamePage extends StatelessWidget {
  const LastNamePage({super.key});

  @override
  Widget build(BuildContext context) {
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
            BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                return Text(
                    'Username: ${state.user.firstName} ${state.user.lastName}');
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Update our user last name here
        onPressed: () {
          // Access the user cubit from the context
          var user = context.read<UserCubit>().state.user;
          user.lastName = 'UpdatedLastName';
          context.read<UserCubit>().updateUser(user);
        },
        child: const Icon(Icons.update),
      ),
    );
  }
}
