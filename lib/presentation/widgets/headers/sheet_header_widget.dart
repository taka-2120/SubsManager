import 'package:flutter/material.dart';
import 'package:subsmanager/presentation/widgets/buttons/circle_button_widget.dart';

class SheetHeader extends StatelessWidget {
  const SheetHeader({
    required this.title,
    required this.funcLeft,
    required this.funcRight,
    Key? key,
  }) : super(key: key);

  final String title;
  final VoidCallback funcLeft;
  final VoidCallback funcRight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleButton(
            icon: const Icon(Icons.close),
            func: funcLeft,
          ),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          CircleButton(
            icon: const Icon(Icons.check),
            func: funcRight,
          ),
        ],
      ),
    );
  }
}
