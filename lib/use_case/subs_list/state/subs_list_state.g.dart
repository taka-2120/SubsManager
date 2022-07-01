// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subs_list_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubsListState _$$_SubsListStateFromJson(Map<String, dynamic> json) =>
    _$_SubsListState(
      subsList: (json['subsList'] as List<dynamic>?)
              ?.map((e) => SubItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <SubItem>[],
    );

Map<String, dynamic> _$$_SubsListStateToJson(_$_SubsListState instance) =>
    <String, dynamic>{
      'subsList': instance.subsList,
    };
