import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:subsmanager/extensions/date_ext.dart';
import 'package:subsmanager/l10n/l10n.dart';

import '../../models/function.dart';
import '../../theme.dart';
import '../pages/subs/subs_edit.dart';
import '../notifiers/subs_list.dart';

Widget subsItem(
    BuildContext context, WidgetRef ref, L10n l10n, int index, Subs item) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    padding: const EdgeInsets.all(15),
    height: 130,
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
            Text(
              item.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            GestureDetector(
              onTap: () {
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
              feeAndPeriod(ref, item.fee, item.period),
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            const SizedBox(
              height: 8,
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
