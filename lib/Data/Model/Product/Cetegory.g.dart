// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Cetegory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cetegory _$CetegoryFromJson(Map<String, dynamic> json) {
  return Cetegory(
    json['id'] as int,
    json['name'] as String,
    json['short_description'] as String,
    json['organization_id'] as String,
  );
}

Map<String, dynamic> _$CetegoryToJson(Cetegory instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'short_description': instance.short_description,
      'organization_id': instance.organization_id,
    };
