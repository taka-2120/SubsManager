import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/extensions/date_ext.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/presentation/widgets/default_divider_widget.dart';
import 'package:subsmanager/theme.dart';
import 'package:subsmanager/use_case/functions/notif_date_func.dart';
import 'package:subsmanager/use_case/notifiers/notif_date.dart';
import 'package:subsmanager/use_case/notifiers/notif_enabled.dart';
import 'package:subsmanager/use_case/notifiers/notif_time.dart';

class NotifDatePicker extends ConsumerWidget {
  const NotifDatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context)!;
    final isNotifEnabled = ref.watch(notifEnabledProvider);
    final notifDate = ref.watch(notifDateProvider);
    final readNotifDate = ref.read(notifDateProvider.notifier);
    final notifTime = ref.watch(notifTimeProvider);
    final readNotifTime = ref.read(notifTimeProvider.notifier);
    final locale = MaterialLocalizations.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: IgnorePointer(
        ignoring: !isNotifEnabled,
        child: Opacity(
          opacity: isNotifEnabled ? 1.0 : 0.6,
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(
                    initialItem: notifDate,
                  ),
                  magnification: 1.22,
                  squeeze: 1.2,
                  useMagnifier: true,
                  itemExtent: 32,
                  onSelectedItemChanged: ((value) =>
                      readNotifDate.update(value)),
                  children: List<Widget>.generate(
                    NotifDates.values.length,
                    (int index) {
                      return Center(
                        child: Text(
                          getNotifDateString(l10n, NotifDates.values[index]),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const DefaultDivider(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text("Time"),
                    ),
                    MaterialButton(
                      child: Text(
                        notifTime.timeToString(locale),
                        style: const TextStyle(fontSize: 16),
                      ),
                      onPressed: () async {
                        readNotifTime.update(
                          await showRoundedTimePicker(
                                context: context,
                                initialTime: notifTime,
                                borderRadius: 20,
                                theme: ThemeData(
                                  primarySwatch: customSwatch,
                                ),
                              ) ??
                              TimeOfDay.now(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
