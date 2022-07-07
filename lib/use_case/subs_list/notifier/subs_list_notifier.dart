import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/domain/auth/auth_services.dart';
import 'package:subsmanager/domain/subs_list/models/sub_item.dart';
import 'package:subsmanager/domain/subs_list/subs_list_repository.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/use_case/sub_value/notifier/sub_value_notifier.dart';
import 'package:subsmanager/use_case/subs_list/state/subs_list_state.dart';
import 'package:uuid/uuid.dart';
import 'package:subsmanager/extensions/period_nstr_int.dart';
import 'package:subsmanager/extensions/fee_str_double.dart';

final subsListNotifierProvider =
    StateNotifierProvider<SubsListNotifier, SubsListState>(
  (ref) => SubsListNotifier(ref: ref),
);

class SubsListNotifier extends StateNotifier<SubsListState> {
  SubsListNotifier({required Ref ref})
      : _ref = ref,
        super(const SubsListState());
  final Ref _ref;

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> addSub(BuildContext context) async {
    final authState = _ref.read(authServicesProvider);
    final subValueState = _ref.read(subValueNotifierProvider);
    final l10n = L10n.of(context)!;

    try {
      final subItem = SubItem(
        uid: authState.currentUid,
        id: const Uuid().v1(),
        name: subValueState.name.text,
        fee: subValueState.fee.text.feeToDouble(),
        url: subValueState.url.text,
        hasIcon: subValueState.hasIcon,
        altHexColorCode: subValueState.altColor.value.toRadixString(16),
        date: subValueState.date,
        period: subValueState.period.periodToInt(l10n),
      );

      state = state.copyWith(
        subsList: [...state.subsList, subItem],
      );

      await _ref.read(subsListRepositoryProvider).addSub(item: subItem);

      //Setup Notification
      // await AwesomeNotifications().createNotification(
      //   content: NotificationContent(
      //     id: 10,
      //     channelKey: 'basic_channel',
      //     title: 'Simple Notification',
      //     body: 'Simple body',
      //   ),
      //   schedule: NotificationCalendar(
      //       month: subItem.date!.month,
      //       day: subItem.date!.day -
      //           _ref.read(notifDateProvider.notifier).getDayBefore(),
      //       hour: _ref.read(notifTimeProvider).hour,
      //       minute: _ref.read(notifTimeProvider).minute,
      //       second: 0,
      //       repeats: true,
      //       allowWhileIdle: true),
      // );
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return;
    }
  }

  Future<void> getSubsList() async {
    final subsList = await _ref.read(subsListRepositoryProvider).getSubsList();
    state = state.copyWith(subsList: subsList);
  }

  Future<void> deleteSub({required SubItem item}) async {
    await _ref.read(subsListRepositoryProvider).deleteSub(item: item);
    state = state.copyWith(
      subsList: state.subsList.where((todo) => todo.id != item.id).toList(),
    );
  }

  Future<void> updateDate() async {
    final currentDate = DateTime.now();
    List<SubItem> updatedList = [];

    for (var item in state.subsList) {
      if (item.date!.compareTo(currentDate) < 0) {
        final updatedDate = DateTime(
          item.date!.year,
          item.date!.month + 1,
          item.date!.day,
        );

        final subItem = SubItem(
          uid: item.uid,
          id: item.id,
          name: item.name,
          fee: item.fee,
          url: item.url,
          hasIcon: item.hasIcon,
          altHexColorCode: item.altHexColorCode,
          date: updatedDate,
          period: item.period,
        );

        updatedList.add(subItem);
        await _ref.read(subsListRepositoryProvider).updateSub(item: subItem);
      } else {
        updatedList.add(item);
      }
    }

    state = state.copyWith(subsList: updatedList);
  }

  Future<void> updateSub(BuildContext context, {required SubItem item}) async {
    final subValueState = _ref.read(subValueNotifierProvider);
    final l10n = L10n.of(context)!;

    final subItem = SubItem(
      uid: item.uid,
      id: item.id,
      name: subValueState.name.text,
      fee: subValueState.fee.text.feeToDouble(),
      url: subValueState.url.text,
      hasIcon: subValueState.hasIcon,
      altHexColorCode: subValueState.altColor.value.toRadixString(16),
      date: subValueState.date,
      period: subValueState.period.periodToInt(l10n),
    );

    List<SubItem> updatedList = [];

    for (var item in state.subsList) {
      if (item.id == subItem.id) {
        updatedList.add(subItem);
      } else {
        updatedList.add(item);
      }
    }

    state = state.copyWith(subsList: updatedList);

    await _ref.read(subsListRepositoryProvider).updateSub(item: subItem);
  }

  void init() {
    state = state.copyWith(subsList: []);
  }

  void sort(int index) {
    List<SubItem> sortedList = [...state.subsList];
    switch (index) {
      case 0:
        sortedList.sort((a, b) => a.name.compareTo(b.name));
        break;
      case 1:
        sortedList.sort((a, b) => b.name.compareTo(a.name));
        break;
      case 2:
        sortedList.sort((a, b) => a.date!.compareTo(b.date!));
        break;
      case 3:
        sortedList.sort((a, b) => b.date!.compareTo(a.date!));
        break;
      case 4:
        sortedList.sort((a, b) => b.fee.compareTo(a.fee));
        break;
      case 5:
        sortedList.sort((a, b) => a.fee.compareTo(b.fee));
        break;
    }
    state = state.copyWith(subsList: sortedList);
  }

  double subSum({
    required bool monthly,
    required List<SubItem> list,
  }) {
    double sum = 0.0;
    if (monthly) {
      for (var i = 0; i < list.length; i++) {
        int? period = list[i].period;
        if (period == 0) {
          sum += list[i].fee;
        } else {
          //EXCEPTION
        }
      }
    } else {
      for (var i = 0; i < list.length; i++) {
        int? period = list[i].period;
        if (period == 0) {
          sum += list[i].fee * 12;
        } else if (period == 1) {
          sum += list[i].fee * 2;
        } else if (period == 2) {
          sum += list[i].fee;
        } else {
          //EXCEPTION
        }
      }
    }
    return sum;
  }
}
