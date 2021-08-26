// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Territory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Territory _$TerritoryFromJson(Map<String, dynamic> json) {
  return Territory(
    json['_id'] as int,
    json['name'] as String,
    json['organization_id'] as String,
  );
}

Map<String, dynamic> _$TerritoryToJson(Territory instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'organization_id': instance.organization_id,
    };
