// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrderDpResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDpResponse _$OrderDpResponseFromJson(Map<String, dynamic> json) {
  return OrderDpResponse(
    json['success'] as bool,
    json['message'] as String,
    (json['data'] as List<dynamic>)
        .map((e) => OrderDp.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$OrderDpResponseToJson(OrderDpResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
