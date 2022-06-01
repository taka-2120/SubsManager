import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/models/periods/periods.state.dart';

final periodsProvider =
    StateNotifierProvider<Periods, PeriodsState>((ref) => Periods());

class Periods extends StateNotifier<PeriodsState> {
  Periods() : super(const PeriodsState());

  void updateLocale(L10n l10n) {
    List<String> localeBasedPeriod = [
      l10n.monthly,
      l10n.semi_annually,
      l10n.annually,
    ];
    state = state.copyWith(periods: localeBasedPeriod);
  }
}
