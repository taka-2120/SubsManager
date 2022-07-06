import 'package:flutter/material.dart';

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
      width: 200,
      decoration: BoxDecoration(
        color: ((backgroundColor == null) ? entryBackground : backgroundColor!)
            .withOpacity(isDisabled ? 0.5 : 1.0),
        borderRadius: BorderRadius.circular(25),
        boxShadow: isDisabled
            ? null
            : [
                BoxShadow(
                  color: ((backgroundColor == null)
                          ? Theme.of(context).shadowColor
                          : backgroundColor!)
                      .withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
      ),
      child: InkWell(
        onTap: isDisabled ? null : onTap,
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
    );
  }
}
