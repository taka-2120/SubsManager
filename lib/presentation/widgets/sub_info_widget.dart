import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/extensions/date_ext.dart';
import 'package:subsmanager/globals.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/presentation/widgets/default_divider_widget.dart';
import 'package:subsmanager/presentation/widgets/favicon_widget.dart';
import 'package:subsmanager/presentation/widgets/textfield_set_widget.dart';
import 'package:subsmanager/theme.dart';
import 'package:subsmanager/use_case/notifiers/sub_value_notifier.dart';

class SubInfo extends HookConsumerWidget {
  const SubInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final valueNotifier = ref.read(subValueNotifierProvider.notifier);
    final valueState = ref.watch(subValueNotifierProvider);
    final l10n = L10n.of(context)!;
    final periods = useState(defaultPeriods);

    useEffect(() {
      periods.value = [
        l10n.monthly,
        l10n.semi_annually,
        l10n.annually,
      ];
      return;
    });

    return Column(
      children: [
        TextFieldSet(
          title: l10n.name,
          type: KeyType.norm,
          controller: valueState.name,
          secured: false,
          suggestion: true,
          divider: true,
          showTitle: true,
        ),
        TextFieldSet(
          title: l10n.fee,
          type: KeyType.num,
          controller: valueState.fee,
          secured: false,
          suggestion: true,
          divider: true,
          showTitle: true,
        ),
        TextFieldSet(
          title: l10n.url,
          type: KeyType.url,
          controller: valueState.url,
          secured: false,
          suggestion: false,
          divider: true,
          showTitle: true,
          rightContent: Favicon(
            url: valueState.url.text,
            altColor: valueState.altColor,
          ),
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
                valueState.date.dateToString(context),
                style: const TextStyle(fontSize: 16),
              ),
              onPressed: () async {
                valueNotifier.updateDate(
                  await showRoundedDatePicker(
                        context: context,
                        initialDate: valueState.date,
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
        const DefaultDivider(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${l10n.billing_period}: ",
              style: const TextStyle(fontSize: 18),
            ),
            CustomDropdownButton2(
              hint: "${l10n.select}...",
              value: valueState.period,
              dropdownItems: periods.value,
              onChanged: (value) => valueNotifier.updatePeriod(value),
            ),
          ],
        ),
      ],
    );
  }
}
