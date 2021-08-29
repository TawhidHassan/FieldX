// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Brand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Brand _$BrandFromJson(Map<String, dynamic> json) {
  return Brand(
    json['id'] as int,
    json['name'] as String,
    json['short_description'] as String,
    json['organization_id'] as String,
  );
}

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'short_description': instance.short_description,
      'organization_id': instance.organization_id,
    };
