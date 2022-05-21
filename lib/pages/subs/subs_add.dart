import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import '../../model.dart' as common;
import '../../globals.dart' as globals;
import '../../functions.dart' as func;
import '../../notifier.dart';

final subDateProvider =
    StateNotifierProvider<SubDate, DateTime>((ref) => SubDate());
final subPeriodProvider =
    StateNotifierProvider<SubPeriod, String>((ref) => SubPeriod());

class SubAdd extends StatelessWidget {
  const SubAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SubAddSheet();
  }
}

@immutable
class SubAddSheet extends ConsumerWidget {
  SubAddSheet({Key? key}) : super(key: key);

  TextEditingController nameCtl = TextEditingController();
  TextEditingController feeCtl = TextEditingController();
  TextEditingController urlCtl = TextEditingController();
  final func.Functions _func = func.Functions();
  //Period List
  final List<String> periodItems = ["Monthly", "Semi-Annually", "Annually"];
  String? selectedPeriod;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subDate = ref.watch(subDateProvider);
    final SubPeriod = ref.watch(subPeriodProvider);

    return Scaffold(
      body: Padding(
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
                const Text(
                  "Next Billing Date: ",
                  style: TextStyle(fontSize: 18),
                ),
                MaterialButton(
                  child: Text(
                    _func.dateToString(subDate, context),
                    style: const TextStyle(fontSize: 16),
                  ),
                  onPressed: () async {
                    ref.read(subDateProvider.notifier).update(
                          await showRoundedDatePicker(
                                context: context,
                                initialDate: subDate,
                                borderRadius: 20,
                                theme: ThemeData(
                                    primarySwatch: globals.customSwatch),
                              ) ??
                              DateTime.now(),
                        );
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
                  value: SubPeriod,
                  dropdownItems: periodItems,
                  onChanged: (value) =>
                      ref.read(subPeriodProvider.notifier).update(value!),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
