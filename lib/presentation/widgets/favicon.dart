import 'package:flutter/material.dart';

Widget favicon({
  required bool isIcon,
  required Image? favicon,
  required Color altColor,
}) {
  return Container(
    height: 50,
    width: 50,
    padding: const EdgeInsets.all(4),
    child: isIcon
        ? favicon!
        : Icon(
            Icons.brightness_1_rounded,
            color: altColor,
          ),
  );
}
