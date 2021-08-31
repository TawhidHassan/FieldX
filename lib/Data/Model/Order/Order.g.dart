// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
    json['order_id'] as String,
    json['sr_name'] as String,
    json['dp_name'] as String,
    json['order_date'] as String,
    json['delivery_date'] as String,
    json['route_id'] as String,
    json['store_id'] as String,
    json['total_before_discount'] as String,
    json['total_after_discount'] as String,
    json['discount'] as String,
    json['vat'] as String,
    json['grand_total'] as String,
    json['user_id'] as String,
    json['organization_id'] as String,
    json['status'] as String,
    json['product_id'] as String,
    json['quantity'] as String,
    json['unit_price'] as String,
    json['sub_total'] as String,
  );
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'order_id': instance.order_id,
      'sr_name': instance.sr_name,
      'dp_name': instance.dp_name,
      'order_date': instance.order_date,
      'delivery_date': instance.delivery_date,
      'route_id': instance.route_id,
      'store_id': instance.store_id,
      'total_before_discount': instance.total_before_discount,
      'total_after_discount': instance.total_after_discount,
      'discount': instance.discount,
      'vat': instance.vat,
      'grand_total': instance.grand_total,
      'user_id': instance.user_id,
      'organization_id': instance.organization_id,
      'status': instance.status,
      'product_id': instance.product_id,
      'quantity': instance.quantity,
      'unit_price': instance.unit_price,
      'sub_total': instance.sub_total,
    };
