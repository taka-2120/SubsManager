import 'package:flutter/material.dart';

class Favicon extends StatelessWidget {
  const Favicon({
    required this.isIcon,
    required this.favicon,
    required this.altColor,
    Key? key,
  }) : super(key: key);

  final bool isIcon;
  final Image? favicon;
  final Color altColor;

  @override
  Widget build(BuildContext context) {
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
}
