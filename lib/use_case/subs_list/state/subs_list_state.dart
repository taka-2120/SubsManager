import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:subsmanager/domain/subs_list/models/sub_item.dart';

part 'subs_list_state.freezed.dart';
part 'subs_list_state.g.dart';

@freezed
class SubsListState with _$SubsListState {
  const factory SubsListState({
    @Default(<SubItem>[]) List<SubItem> subsList,
  }) = _SubsListState;

  factory SubsListState.fromJson(Map<String, dynamic> json) =>
      _$SubsListStateFromJson(json);
}
