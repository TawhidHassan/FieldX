// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Area.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Area _$AreaFromJson(Map<String, dynamic> json) {
  return Area(
    json['id'] as int,
    json['name'] as String,
    json['organization_id'] as String,
  );
}

Map<String, dynamic> _$AreaToJson(Area instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'organization_id': instance.organization_id,
    };
