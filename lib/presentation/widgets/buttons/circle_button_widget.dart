import 'package:flutter/material.dart';
import 'package:subsmanager/theme.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    required this.icon,
    required this.func,
    Key? key,
  }) : super(key: key);
  final Icon icon;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
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
}
