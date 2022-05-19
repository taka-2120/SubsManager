import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:provider/provider.dart';
import '../../common.dart' as common;
import '../../globals.dart' as globals;
import '../../functions.dart' as func;
import '../../models.dart' as models;

class SubsAdd extends StatelessWidget {
  const SubsAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => models.SubsAddModel()),
      ],
      child: const SubsAddSheet(),
    );
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
  func.Functions _func = func.Functions();
  //Period List
  final List<String> periodItems = ["Monthly", "Semi-Annually", "Annually"];
  String? selectedPeriod;

  @override
  Widget build(BuildContext context) {
    return Consumer<models.SubsAddModel>(builder: ((context, model, child) {
      return Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            common.sheetHeader("Add", context),
            common.textFieldSet(context, "Name", false, nameCtl),
            common.textFieldSet(context, "Fee", true, feeCtl),
            common.textFieldSet(context, "URL", false, urlCtl),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Next Billing Date: ",
                    style: TextStyle(fontSize: 18)),
                MaterialButton(
                  child: Text(_func.dateToString(model.date, context),
                      style: const TextStyle(fontSize: 16)),
                  onPressed: () async {
                    model.date = await showRoundedDatePicker(
                            context: context,
                            initialDate: model.date,
                            borderRadius: 20,
                            theme: ThemeData(
                                primarySwatch: globals.customSwatch)) ??
                        DateTime.now();
                  },
                ),
              ],
            ),
            common.defaultDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Billing Period: ", style: TextStyle(fontSize: 18)),
                CustomDropdownButton2(
                  hint: "Select...",
                  value: selectedPeriod,
                  dropdownItems: periodItems,
                  onChanged: (value) {
                    setState(() {
                      selectedPeriod = value;
                    });
                  },
                )
              ],
            )
          ],
        ),
      );
    }));
  }
}
