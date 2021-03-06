import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/presentation/widgets/default_divider_widget.dart';
import 'package:subsmanager/theme.dart';
import 'package:subsmanager/use_case/functions/keyboard_func.dart';
import 'package:subsmanager/use_case/sub_value/notifier/sub_value_notifier.dart';

class TextFieldSet extends ConsumerWidget {
  const TextFieldSet(
      {required this.title,
      required this.type,
      required this.controller,
      required this.secured,
      required this.suggestion,
      required this.divider,
      required this.showTitle,
      this.favicon,
      this.bottomNotes,
      Key? key})
      : super(key: key);

  final String title;
  final KeyType type;
  final TextEditingController controller;
  final bool secured;
  final bool suggestion;
  final bool divider;
  final bool showTitle;
  final Widget? favicon;
  final String? bottomNotes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readSubValue = ref.read(subValueNotifierProvider.notifier);

    return Column(children: [
      showTitle
          ? Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            )
          : const SizedBox(),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (favicon != null)
                  ? Row(children: [favicon!, const SizedBox(width: 4)])
                  : const SizedBox(
                      height: 0,
                      width: 0,
                    ),
              Flexible(
                child: Container(
                  width: 500,
                  decoration: BoxDecoration(
                    color: entryBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: controller,
                    autocorrect: suggestion,
                    enableSuggestions: suggestion,
                    obscureText: secured,
                    keyboardType: setKeyType(type),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: title,
                      contentPadding: const EdgeInsets.all(10),
                    ),
                    onChanged: (text) {
                      (favicon != null)
                          ? readSubValue.generateFavicon(text)
                          : null;
                    },
                  ),
                ),
              ),
            ],
          ),
          (bottomNotes != null)
              ? Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    bottomNotes!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                )
              : const SizedBox(
                  height: 0,
                  width: 0,
                ),
        ],
      ),
      divider
          ? const DefaultDivider(height: 40)
          : const SizedBox(
              width: 0,
              height: 0,
            )
    ]);
  }
}
