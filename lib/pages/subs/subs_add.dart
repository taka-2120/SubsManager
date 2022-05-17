import 'package:flutter/material.dart';
import '../../common.dart' as common;

class SubsAdd extends StatelessWidget {
  const SubsAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SubsAddSheet();
  }
}

class SubsAddSheet extends StatefulWidget {
  const SubsAddSheet({Key? key}) : super(key: key);

  @override
  State<SubsAddSheet> createState() => _SubsAddState();
}

class _SubsAddState extends State<SubsAddSheet> {
  TextEditingController nameCtl = TextEditingController();
  TextEditingController feeCtl = TextEditingController();
  TextEditingController urlCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: common.header("Add", context),
            ),
            common.TextFieldSet("Name", nameCtl),
            common.TextFieldSet("Fee", feeCtl),
            common.TextFieldSet("URL", urlCtl),
          ],
        ),
      ),
    );
  }
}
