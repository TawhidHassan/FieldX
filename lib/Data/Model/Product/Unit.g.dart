// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Unit _$UnitFromJson(Map<String, dynamic> json) {
  return Unit(
    json['id'] as int,
    json['name'] as String,
    json['short_name'] as String,
    json['organization_id'] as String,
  );
}

Map<String, dynamic> _$UnitToJson(Unit instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'short_name': instance.short_name,
      'organization_id': instance.organization_id,
    };
