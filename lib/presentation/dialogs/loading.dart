import 'dart:math';

import 'package:flutter/material.dart';
import 'package:subsmanager/l10n/l10n.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;

    return Dialog(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Padding(
            padding: EdgeInsets.all(15),
            child: CircularProgressIndicator(),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
            child: Text("Loading"),
          ),
        ],
      ),
    );
  }
}
