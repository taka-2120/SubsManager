import 'package:flutter/material.dart';
import 'package:subsmanager/theme.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    required this.icon,
    required this.left,
    required this.right,
    required this.navigatable,
    required this.disposable,
    this.destination,
    this.func,
    Key? key,
  }) : super(key: key);

  final Icon icon;
  final String left;
  final String right;
  final bool navigatable;
  final bool disposable;
  final StatelessWidget? destination;
  final VoidCallback? func;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: (func != null)
            ? func
            : () {
                if (navigatable || destination != null) {
                  if (disposable) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => destination!,
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => destination!,
                      ),
                    );
                  }
                }
              },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  icon,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(left),
                  ),
                ],
              ),
              navigatable ? const Icon(Icons.arrow_right) : Text(right)
            ],
          ),
        ),
      ),
    );
  }
}
