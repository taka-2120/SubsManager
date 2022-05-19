import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import '../../common.dart' as common;
import '../../globals.dart' as globals;
import 'subs_functions.dart' as subs_func;

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
  subs_func.SubsFunctions func = subs_func.SubsFunctions();

  @override
  Widget build(BuildContext context) {
    String date = func.dateToString(DateTime.now(), context);

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
            common.textFieldSet("Name", nameCtl),
            common.textFieldSet("Fee", feeCtl),
            common.textFieldSet("URL", urlCtl),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 15), child: Text("")),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: MaterialButton(
                child: Text(date),
                onPressed: () async {
                  DateTime newDate = await showRoundedDatePicker(
                      context: context,
                      theme: ThemeData(primarySwatch: globals.customSwatch));
                  setState(() {
                    date = func.dateToString(newDate, context);
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
