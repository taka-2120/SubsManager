import 'package:freezed_annotation/freezed_annotation.dart';

part 'periods.state.freezed.dart';

const List<String> defaultPeriods = [
  "Monthly",
  "Semi-Annually",
  "Annually",
];

@freezed
class PeriodsState with _$PeriodsState {
  const factory PeriodsState({
    @Default(defaultPeriods) List<String> periods,
  }) = _PeriodsState;
}
