import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/use_case/user_data/state/user_data.state.dart';

final userDataProvider = StateNotifierProvider<UserData, UserDataState>(
  (ref) => UserData(),
);

class UserData extends StateNotifier<UserDataState> {
  UserData() : super(UserDataState());

  Future<void> updateUsername(String username) async {
    final error = username.isEmpty;
    state = state.copyWith(error: error);
    if (!error) {
      state = state.copyWith(username: username, error: error);
      FirebaseAuth.instance.currentUser!.updateDisplayName(username);
      FirebaseAuth.instance.userChanges();
    }
  }

  Future<void> setData(String email, String name) async {
    state = state.copyWith(email: email, username: name);
  }

  Future<void> init() async {
    state = state.copyWith(
      email: "",
      username: "Not Set",
    );
  }
}
