import 'package:flutter/material.dart';
import 'package:subsmanager/l10n/l10n.dart';

import '../../theme.dart';

class RoundededButton extends StatelessWidget {
  const RoundededButton({
    required this.text,
    required this.topPad,
    required this.isDisabled,
    this.fontColor,
    this.backgroundColor,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String text;
  final double topPad;
  final bool isDisabled;
  final Color? fontColor;
  final Color? backgroundColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: topPad),
      decoration: BoxDecoration(
        color: ((backgroundColor == null) ? entryBackground : backgroundColor)!
            .withOpacity(isDisabled ? 0.6 : 1.0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: isDisabled ? null : onTap,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 160),
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: fontColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
