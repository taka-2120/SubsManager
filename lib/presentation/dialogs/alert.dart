import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:subsmanager/l10n/l10n.dart';

class CustomAlertDialog extends StatefulWidget {
  const CustomAlertDialog(
      {Key? key,
      required this.title,
      required this.description,
      required this.ok})
      : super(key: key);

  final String title, description;
  final bool ok;

  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
      child: Dialog(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
              child: Center(
                child: Text(
                  widget.description,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Divider(
              height: 1,
            ),
            widget.ok
                ? SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Center(
                        child: Text(
                          l10n.d_ok,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                : Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: InkWell(
                          onTap: () {
                            //do somethig
                          },
                          child: Center(
                            child: Text(
                              l10n.d_continue,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 1,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: InkWell(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                          ),
                          highlightColor: Colors.grey[200],
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Center(
                            child: Text(
                              l10n.d_cancel,
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
