// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrderDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetails _$OrderDetailsFromJson(Map<String, dynamic> json) {
  return OrderDetails(
    (json['order'] as List<dynamic>)
        .map((e) => OrderOrder.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['products'] as List<dynamic>)
        .map((e) => OrderProduct.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['store'] as List<dynamic>)
        .map((e) => OrderStore.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['sr_name'] as List<dynamic>)
        .map((e) => OrderSr.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['dp_name'] as List<dynamic>)
        .map((e) => OrderDpName.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['ordered_items'] as List<dynamic>)
        .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$OrderDetailsToJson(OrderDetails instance) =>
    <String, dynamic>{
      'order': instance.order,
      'products': instance.products,
      'store': instance.store,
      'sr_name': instance.sr_name,
      'dp_name': instance.dp_name,
      'ordered_items': instance.ordered_items,
    };
