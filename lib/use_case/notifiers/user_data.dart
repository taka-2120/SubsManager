import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/domain/models/user_data/user_data.state.dart';

final userDataProvider =
    StateNotifierProvider<UserData, UserDataState>((ref) => UserData());

class UserData extends StateNotifier<UserDataState> {
  UserData() : super(UserDataState());

  void update(String email, String pass) {
    state = state.copyWith(email: email, pass: pass);
  }
}
