import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user.dart';

class UserCubit extends Cubit<UserState> {
  // Initialize with a default user
  UserCubit() : super(UserState(User('Jack', 'Don')));

  void updateUser(User user) {
    return emit(UserState(user));
  }
}

class UserState {
  User user;

  UserState(this.user);
}
