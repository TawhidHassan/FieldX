// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrderDetailsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailsResponse _$OrderDetailsResponseFromJson(Map<String, dynamic> json) {
  return OrderDetailsResponse(
    json['success'] as bool,
    json['message'] as String,
    OrderDetails.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OrderDetailsResponseToJson(
        OrderDetailsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
