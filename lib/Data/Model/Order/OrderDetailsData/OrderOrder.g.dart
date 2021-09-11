// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrderOrder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderOrder _$OrderOrderFromJson(Map<String, dynamic> json) {
  return OrderOrder(
    json['id'] as String,
    json['order_date'] as String,
    json['delivery_date'] as String,
    json['total_before_discount'] as String,
    json['total_after_discount'] as String,
    json['discount'] as String,
    json['vat'] as String,
    json['grand_total'] as String,
    json['status'] as String,
  );
}

Map<String, dynamic> _$OrderOrderToJson(OrderOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_date': instance.order_date,
      'delivery_date': instance.delivery_date,
      'total_before_discount': instance.total_before_discount,
      'total_after_discount': instance.total_after_discount,
      'discount': instance.discount,
      'vat': instance.vat,
      'grand_total': instance.grand_total,
      'status': instance.status,
    };
