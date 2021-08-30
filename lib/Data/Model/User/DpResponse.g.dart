// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DpResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DpResponse _$DpResponseFromJson(Map<String, dynamic> json) {
  return DpResponse(
    json['success'] as bool,
    json['message'] as String,
    (json['data'] as List<dynamic>)
        .map((e) => Dp.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DpResponseToJson(DpResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
