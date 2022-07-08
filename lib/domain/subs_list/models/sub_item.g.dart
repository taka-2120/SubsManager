// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubItem _$$_SubItemFromJson(Map<String, dynamic> json) => _$_SubItem(
      id: json['id'] as String? ?? "",
      uid: json['uid'] as String? ?? "",
      name: json['name'] as String? ?? "",
      fee: (json['fee'] as num?)?.toDouble() ?? 0,
      url: json['url'] as String? ?? "",
      hasIcon: json['hasIcon'] as bool? ?? false,
      altHexColorCode: json['altHexColorCode'] as String? ?? "0xFF32C9BD",
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      period: json['period'] as int?,
    );

Map<String, dynamic> _$$_SubItemToJson(_$_SubItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'fee': instance.fee,
      'url': instance.url,
      'hasIcon': instance.hasIcon,
      'altHexColorCode': instance.altHexColorCode,
      'date': instance.date?.toIso8601String(),
      'period': instance.period,
    };
