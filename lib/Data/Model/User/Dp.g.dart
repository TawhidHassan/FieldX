// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Dp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dp _$DpFromJson(Map<String, dynamic> json) {
  return Dp(
    json['route_name'] as String,
    json['dp_id'] as String,
    json['dp_first_name'] as String,
    json['dp_last_name'] as String,
  );
}

Map<String, dynamic> _$DpToJson(Dp instance) => <String, dynamic>{
      'route_name': instance.route_name,
      'dp_id': instance.dp_id,
      'dp_first_name': instance.dp_first_name,
      'dp_last_name': instance.dp_last_name,
    };
