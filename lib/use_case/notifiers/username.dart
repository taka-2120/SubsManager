import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/domain/models/username/username.state.dart';

final usernameProvider = StateNotifierProvider<Username, UsernameState>(
  (ref) => Username(),
);

class Username extends StateNotifier<UsernameState> {
  Username() : super(const UsernameState());

  void update(String username, BuildContext context) {
    final error = username.isEmpty;
    state = state.copyWith(error: error);
    if (!error) {
      state = state.copyWith(username: username, error: error);
      FirebaseAuth.instance.currentUser!.updateDisplayName(username);
      FirebaseAuth.instance.userChanges();
      Navigator.of(context).pop();
    }
  }
}
