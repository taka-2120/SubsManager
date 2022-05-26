import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import '../../globals.dart';
import '../../model.dart' as common;
import '../../functions.dart';

class SubAdd extends StatelessWidget {
  const SubAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SubAddSheet();
  }
}

class SubAddSheet extends ConsumerWidget {
  SubAddSheet({Key? key}) : super(key: key);
  Functions func = Functions();

  TextEditingController nameCtl = TextEditingController();
  TextEditingController feeCtl = TextEditingController();
  TextEditingController urlCtl = TextEditingController();
  final Functions _func = Functions();
  //Period List
  final List<String> periodItems = ["Monthly", "Semi-Annually", "Annually"];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subDate = ref.watch(subDateProvider);
    final subPeriod = ref.watch(subPeriodProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            common.sheetHeader(
              "Add",
              context,
              () => Navigator.pop(context),
              () => func.addSub(
                context,
                ref,
                nameCtl.text,
                func.feeToDouble(feeCtl.text),
                func.periodToInt(subPeriod),
                subDate,
                Uri.parse(urlCtl.text),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    common.textFieldSet(context, "Name", false, nameCtl, true),
                    common.textFieldSet(context, "Fee", true, feeCtl, false),
                    common.textFieldSet(context, "URL", false, urlCtl, false),
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
                                            primarySwatch: customSwatch),
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
                        const Text("Billing Period: ",
                            style: TextStyle(fontSize: 18)),
                        CustomDropdownButton2(
                          hint: "Select...",
                          value: subPeriod,
                          dropdownItems: periodItems,
                          onChanged: (value) => ref
                              .read(subPeriodProvider.notifier)
                              .update(value),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
