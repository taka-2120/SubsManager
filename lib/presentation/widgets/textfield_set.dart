import 'package:flutter/material.dart';

import '../../theme.dart';
import 'default_divider.dart';

Widget textFieldSet({
  required BuildContext context,
  required String title,
  required bool num,
  required TextEditingController controller,
  required bool url,
}) {
  return Column(children: [
    Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: entryBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        keyboardType: num
            ? TextInputType.number
            : (url ? TextInputType.text : TextInputType.url),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: title,
          contentPadding: const EdgeInsets.all(10),
        ),
      ),
    ),
    defaultDivider()
  ]);
}
