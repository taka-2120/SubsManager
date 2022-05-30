import 'package:flutter/material.dart';

import 'circle_button.dart';

Widget sheetHeader(String title, BuildContext context, VoidCallback funcLeft,
    VoidCallback funcRight) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        circleButton(context, const Icon(Icons.close), funcLeft),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        circleButton(context, const Icon(Icons.check), funcRight),
      ],
    ),
  );
}
