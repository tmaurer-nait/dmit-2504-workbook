import '../models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/user_cubit.dart';

class FirstNamePage extends StatelessWidget {
  const FirstNamePage({super.key});

  @override
  Widget build(BuildContext context) {
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
            BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                return Text(
                    'UserName: ${state.user.firstName} ${state.user.lastName}');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Update our user firs name here
        onPressed: () {
          // Access the user state from the context
          var user = context.read<UserCubit>().state.user;
          user.firstName = 'UpdatedFirstName';
          context.read<UserCubit>().updateUser(user);
        },
        child: const Icon(Icons.update),
      ),
    );
  }
}
