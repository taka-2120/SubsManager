import 'package:flutter/material.dart';
import 'package:subsmanager/l10n/l10n.dart';

import '../../theme.dart';

class RoundededButton extends StatelessWidget {
  const RoundededButton({
    required this.text,
    required this.topPad,
    this.fontColor,
    this.backgroundColor,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String text;
  final double topPad;
  final Color? fontColor;
  final Color? backgroundColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;

    return Container(
      margin: EdgeInsets.only(top: topPad),
      decoration: BoxDecoration(
        color: (backgroundColor == null) ? entryBackground : backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 180, //Set Mininum Width
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: fontColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
