import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/presentation/notifiers/sub_value.dart';

import '../../globals.dart';
import '../../models.dart';
import '../../theme.dart';
import '../widgets/default_divider.dart';
import 'textfield_set.dart';

Widget subsInfo(
  BuildContext context,
  WidgetRef ref,
  TextEditingController nameCtl,
  TextEditingController feeCtl,
  TextEditingController urlCtl,
  DateTime subDate,
  String? subPeriod,
) {
  final Functions func = Functions();
  final readSubValue = ref.read(subValueProvider.notifier);

  return Column(
    children: [
      textFieldSet(context, "Name", false, nameCtl, true),
      textFieldSet(context, "Fee", true, feeCtl, false),
      textFieldSet(context, "URL", false, urlCtl, false),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Next Billing Date: ",
            style: TextStyle(fontSize: 18),
          ),
          MaterialButton(
            child: Text(
              func.dateToString(subDate, context),
              style: const TextStyle(fontSize: 16),
            ),
            onPressed: () async {
              readSubValue.updateDate(
                await showRoundedDatePicker(
                      context: context,
                      initialDate: subDate,
                      borderRadius: 20,
                      theme: ThemeData(primarySwatch: customSwatch),
                    ) ??
                    DateTime.now(),
              );
            },
          ),
        ],
      ),
      defaultDivider(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Billing Period: ", style: TextStyle(fontSize: 18)),
          CustomDropdownButton2(
            hint: "Select...",
            value: subPeriod,
            dropdownItems: periodItems,
            onChanged: (value) => readSubValue.updatePeriod(value),
          ),
        ],
      ),
    ],
  );
}
