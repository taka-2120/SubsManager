import 'dart:math';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:subsmanager/presentation/notifiers/favicon_value.dart';

Widget favicon(WidgetRef ref) {
  String url = ref.watch(faviconValueProvider).url;
  bool isVaild = ref.watch(faviconValueProvider).isVaild;
  Color randomColor =
      Colors.primaries[Random().nextInt(Colors.primaries.length)];

  return Container(
    height: 60,
    width: 60,
    padding: const EdgeInsets.all(8),
    child: isVaild
        ? Image.network(url)
        : Icon(
            Icons.brightness_1_rounded,
            color: randomColor,
          ),
  );
}
