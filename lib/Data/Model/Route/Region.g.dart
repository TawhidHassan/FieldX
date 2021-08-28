// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Region _$RegionFromJson(Map<String, dynamic> json) {
  return Region(
    json['id'] as int,
    json['name'] as String,
    json['organization_id'] as String,
  );
}

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'organization_id': instance.organization_id,
    };
