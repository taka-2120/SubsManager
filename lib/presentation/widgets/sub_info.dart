import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/models/value_convert.dart';
import 'package:subsmanager/presentation/notifiers/sub_value.dart';

import '../../theme.dart';
import '../hooks/period.dart';
import '../pages/subs/subs_list.dart';
import '../widgets/default_divider.dart';
import 'textfield_set.dart';

Widget subsInfo(
  BuildContext context,
  WidgetRef ref,
) {
  final Convert conv = Convert();
  final subValue = ref.watch(subValueProvider.select((value) => value));
  final readSubValue = ref.read(subValueProvider.notifier);

  return Column(
    children: [
      textFieldSet(
          context: context,
          title: "Name",
          num: false,
          controller: subValue.name,
          url: true),
      textFieldSet(
          context: context,
          title: "Fee",
          num: true,
          controller: subValue.fee,
          url: true),
      textFieldSet(
          context: context,
          title: "URL",
          num: false,
          controller: subValue.url,
          url: true),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Next Billing Date: ",
            style: TextStyle(fontSize: 18),
          ),
          MaterialButton(
            child: Text(
              conv.dateToString(subValue.date, context),
              style: const TextStyle(fontSize: 16),
            ),
            onPressed: () async {
              readSubValue.updateDate(
                await showRoundedDatePicker(
                      context: context,
                      initialDate: subValue.date,
                      borderRadius: 20,
                      theme: ThemeData(
                        primarySwatch: customSwatch,
                      ),
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
          const Text(
            "Billing Period: ",
            style: TextStyle(fontSize: 18),
          ),
          CustomDropdownButton2(
            hint: "Select...",
            value: subValue.period,
            dropdownItems: periodItems,
            onChanged: (value) => readSubValue.updatePeriod(value),
          ),
        ],
      ),
    ],
  );
}
