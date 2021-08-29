// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ShopResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopResponse _$ShopResponseFromJson(Map<String, dynamic> json) {
  return ShopResponse(
    json['success'] as bool,
    json['message'] as String,
    (json['data'] as List<dynamic>)
        .map((e) => Shop.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ShopResponseToJson(ShopResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
