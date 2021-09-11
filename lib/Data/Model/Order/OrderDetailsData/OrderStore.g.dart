// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrderStore.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderStore _$OrderStoreFromJson(Map<String, dynamic> json) {
  return OrderStore(
    json['id'] as String,
    json['name'] as String,
    json['store_code'] as String,
    json['owner_name'] as String,
  );
}

Map<String, dynamic> _$OrderStoreToJson(OrderStore instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'store_code': instance.store_code,
      'owner_name': instance.owner_name,
    };
