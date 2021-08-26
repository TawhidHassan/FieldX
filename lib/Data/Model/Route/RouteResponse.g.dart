// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RouteResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteResponse _$RouteResponseFromJson(Map<String, dynamic> json) {
  return RouteResponse(
    json['current_page'] as int,
    (json['data'] as List<dynamic>)
        .map((e) => Route.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$RouteResponseToJson(RouteResponse instance) =>
    <String, dynamic>{
      'current_page': instance.current_page,
      'data': instance.data,
    };
