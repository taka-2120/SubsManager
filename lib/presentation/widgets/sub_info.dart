import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/extensions/date_ext.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/presentation/notifiers/periods.dart';
import 'package:subsmanager/presentation/notifiers/sub_value.dart';
import 'package:subsmanager/presentation/widgets/favicon.dart';

import '../../theme.dart';
import '../widgets/default_divider.dart';
import 'textfield_set.dart';

Widget subsInfo(
  BuildContext context,
  L10n l10n,
  WidgetRef ref,
) {
  final periods = ref
      .watch(
        periodsProvider.select((value) => value),
      )
      .periods;
  final subValue = ref.watch(
    subValueProvider.select((value) => value),
  );
  final readSubValue = ref.read(subValueProvider.notifier);

  return Column(
    children: [
      TextFieldSet(
        title: l10n.name,
        num: false,
        controller: subValue.name,
        format: true,
        rightContent: null,
        bottomNotes: null,
      ),
      TextFieldSet(
        title: l10n.fee,
        num: true,
        controller: subValue.fee,
        format: true,
        rightContent: null,
        bottomNotes: null,
      ),
      TextFieldSet(
        title: l10n.url,
        num: false,
        controller: subValue.url,
        format: true,
        rightContent: favicon(ref),
        bottomNotes:
            "If you type the domain of provider's URL, the icon will be shown up at the right next of the name.",
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${l10n.next_billing_date}: ",
            style: const TextStyle(fontSize: 18),
          ),
          MaterialButton(
            child: Text(
              subValue.date.dateToString(context),
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
          Text(
            "${l10n.billing_period}: ",
            style: const TextStyle(fontSize: 18),
          ),
          CustomDropdownButton2(
            hint: "${l10n.select}...",
            value: subValue.period,
            dropdownItems: periods,
            onChanged: (value) => readSubValue.updatePeriod(value),
          ),
        ],
      ),
    ],
  );
}
