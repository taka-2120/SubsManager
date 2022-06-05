import 'package:flutter/material.dart';
import 'package:subsmanager/l10n/l10n.dart';

import '../../theme.dart';

class RoundededButton extends StatelessWidget {
  const RoundededButton({
    required this.text,
    required this.fontColor,
    required this.topPad,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String text;
  final Color fontColor;
  final double topPad;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;

    return Container(
      margin: EdgeInsets.only(top: topPad),
      decoration: BoxDecoration(
        color: entryBackground,
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
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
        onTap: () => onTap,
      ),
    );
  }
}
