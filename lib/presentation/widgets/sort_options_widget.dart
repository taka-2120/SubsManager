import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/globals.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/use_case/notifiers/sort_option.dart';

void showSortOptions(BuildContext context, WidgetRef ref) async {
  final screenSize = MediaQuery.of(context).size;
  final l10n = L10n.of(context)!;
  final sortOption = ref.read(sortOptionProvider.notifier);
  final Offset offset = Offset(screenSize.width - 10, 95);
  double left = offset.dx;
  double top = offset.dy;
  double right = screenSize.width - offset.dx;
  double bottom = screenSize.height - offset.dy;

  await showMenu<SortOptions>(
    context: context,
    position: RelativeRect.fromLTRB(left, top, right, bottom),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15.0),
      ),
    ),
    items: SortOptions.values
        .map(
          (SortOptions menuItemType) => PopupMenuItem<SortOptions>(
            value: menuItemType,
            child: Text(
              getSortOptionsString(l10n, menuItemType),
            ),
          ),
        )
        .toList(),
  ).then(
    (item) {
      sortOption.update(item?.index ?? 0);
    },
  );
}
