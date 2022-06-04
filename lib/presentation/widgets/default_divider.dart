import 'package:flutter/material.dart';

class DefaultDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Divider(height: 40, thickness: 1),
    );
  }
}
