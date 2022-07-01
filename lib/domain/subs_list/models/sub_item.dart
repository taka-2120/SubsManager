import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_item.freezed.dart';
part 'sub_item.g.dart';

@freezed
class SubItem with _$SubItem {
  const SubItem._();
  const factory SubItem({
    @Default("") String id,
    @Default("") String uid,
    @Default("") String name,
    @Default(0) double fee,
    @Default("") String url,
    @Default(false) bool hasIcon,
    @Default("0xFF32C9BD") String altHexColorCode,
    @Default(null) DateTime? date,
    @Default(null) int? period,
  }) = _SubItem;

  factory SubItem.fromJson(Map<String, dynamic> json) =>
      _$SubItemFromJson(json);

  static String docPath(String id) => 'subs_list/$id';
}
