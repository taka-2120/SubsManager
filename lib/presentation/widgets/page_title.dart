import 'package:flutter/material.dart';

import '../../theme.dart';
import 'circle_button.dart';

Widget pageTitle(BuildContext context, String title, bool back,
    bool rightButton, VoidCallback? rightFunc, Icon? rightIcon) {
  return Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        back
            ? GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.transparent,
                  foregroundColor: customSwatch,
                  child: Icon(Icons.arrow_back_ios_new_rounded),
                ),
              )
            : const SizedBox(width: 40, height: 40),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        rightButton
            ? circleButton(context, rightIcon!, rightFunc!)
            : const SizedBox(width: 40, height: 40),
      ],
    ),
  );
}
