// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrderProduct.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderProduct _$OrderProductFromJson(Map<String, dynamic> json) {
  return OrderProduct(
    json['id'] as String,
    json['name'] as String,
    json['model_no'] as String,
    json['unit_price'] as String,
    json['max_discount'] as String,
    json['image'] as String,
  );
}

Map<String, dynamic> _$OrderProductToJson(OrderProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'model_no': instance.model_no,
      'unit_price': instance.unit_price,
      'max_discount': instance.max_discount,
      'image': instance.image,
    };
