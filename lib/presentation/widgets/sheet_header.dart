import 'package:flutter/material.dart';

import 'circle_button.dart';

Widget sheetHeader(
  String title,
  BuildContext context,
  VoidCallback funcLeft,
  VoidCallback funcRight,
) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        circleButton(
          context,
          icon: const Icon(Icons.close),
          func: funcLeft,
        ),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        circleButton(
          context,
          icon: const Icon(Icons.check),
          func: funcRight,
        ),
      ],
    ),
  );
}
