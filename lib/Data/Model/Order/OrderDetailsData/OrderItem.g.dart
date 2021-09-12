// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrderItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return OrderItem(
    json['quantity'] as String,
    json['unit_price'] as String,
    json['sub_total'] as String,
  );
}

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'quantity': instance.quantity,
      'unit_price': instance.unit_price,
      'sub_total': instance.sub_total,
    };
