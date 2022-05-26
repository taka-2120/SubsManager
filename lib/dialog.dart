import 'package:flutter/material.dart';

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
    return Dialog(
      elevation: 0,
      backgroundColor: const Color(0xffffffff),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Text(widget.description),
          const SizedBox(height: 20),
          const Divider(
            height: 1,
          ),
          widget.ok
              ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: InkWell(
                    highlightColor: Colors.grey[200],
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Text(
                        "OK",
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
                        highlightColor: Colors.grey[200],
                        onTap: () {
                          //do somethig
                        },
                        child: Center(
                          child: Text(
                            "Continue",
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
                        child: const Center(
                          child: Text(
                            "Cancel",
                            style: TextStyle(
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
    );
  }
}
