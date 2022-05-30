import 'package:flutter/material.dart';

import '../../theme.dart';

Widget settingsItem(BuildContext context, Icon icon, String left, String right,
    bool navigatable,
    {StatelessWidget? destination}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
    decoration: BoxDecoration(
      border: Border.all(color: borderColor),
      borderRadius: BorderRadius.circular(15),
    ),
    child: InkWell(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                icon,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(left),
                ),
              ],
            ),
            navigatable ? const Icon(Icons.arrow_right) : Text(right)
          ],
        ),
      ),
      onTap: () {
        if (navigatable) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination!),
          );
        }
      },
    ),
  );
}
