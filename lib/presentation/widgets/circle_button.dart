import 'package:flutter/material.dart';

import '../../theme.dart';

Widget circleButton(BuildContext context, Icon icon, VoidCallback func) {
  return GestureDetector(
    onTap: () => func(),
    child: CircleAvatar(
      radius: 16,
      backgroundColor: entryBackground,
      foregroundColor: primaryColor,
      child: icon,
    ),
  );
}
