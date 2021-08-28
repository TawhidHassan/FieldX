// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Route _$RouteFromJson(Map<String, dynamic> json) {
  return Route(
    json['id'] as int,
    json['name'] as String,
    json['organization_id'] as String,
    Territory.fromJson(json['territory'] as Map<String, dynamic>),
    Area.fromJson(json['area'] as Map<String, dynamic>),
    Region.fromJson(json['region'] as Map<String, dynamic>),
    User.fromJson(json['sr'] as Map<String, dynamic>),
    User.fromJson(json['dp'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RouteToJson(Route instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'organization_id': instance.organization_id,
      'territory': instance.territory,
      'area': instance.area,
      'region': instance.region,
      'sr': instance.sr,
      'dp': instance.dp,
    };
