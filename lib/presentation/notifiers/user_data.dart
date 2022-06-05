import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/user_data/user_data.state.dart';

final userDataProvider =
    StateNotifierProvider<UserData, UserDataState>((ref) => UserData());

class UserData extends StateNotifier<UserDataState> {
  UserData() : super(UserDataState());

  void update(String userName, String pass) {
    state = state.copyWith(userName: userName, pass: pass);
  }
}
