import 'package:flutter/material.dart';
import 'package:subsmanager/l10n/l10n.dart';

import '../../theme.dart';

class RoundededButton extends StatelessWidget {
  const RoundededButton({
    required this.text,
    required this.fontColor,
    required this.topPad,
    this.backgroundColor,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String text;
  final Color fontColor;
  final double topPad;
  final Color? backgroundColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;

    return Container(
      margin: EdgeInsets.only(top: topPad),
      decoration: BoxDecoration(
        color: (backgroundColor == null) ? entryBackground : backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 130,
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: fontColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
