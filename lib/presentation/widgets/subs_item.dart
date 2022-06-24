import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:subsmanager/domain/models/sub_item/sub_item.state.dart';
import 'package:subsmanager/extensions/date_ext.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/presentation/pages/subs/subs_edit.dart';
import 'package:subsmanager/presentation/widgets/favicon.dart';
import 'package:subsmanager/theme.dart';
import 'package:subsmanager/use_case/converters.dart';
import 'package:subsmanager/use_case/notifiers/sub_value.dart';

class SubsItem extends ConsumerWidget {
  const SubsItem({
    required this.index,
    required this.item,
    Key? key,
  }) : super(key: key);

  final int index;
  final SubItemState item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context)!;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      padding: const EdgeInsets.all(15),
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Favicon(
                    favicon: item.favicon,
                    isIcon: item.isIcon,
                    altColor: item.altColor,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    item.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  ref.read(subValueProvider.notifier).init();
                  showBarModalBottomSheet(
                    context: context,
                    builder: (context) => SubEdit(index, item),
                    bounce: true,
                    expand: true,
                  );
                },
                child: const Icon(
                  Icons.more_horiz_rounded,
                  color: Colors.grey,
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                Converters().combineFeePeriodAsString(
                  ref,
                  fee: item.fee,
                  period: item.period,
                ),
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "${l10n.next}: ${item.date.dateToString(context)}",
                style: const TextStyle(
                    color: borderColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
