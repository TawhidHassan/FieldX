// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shop _$ShopFromJson(Map<String, dynamic> json) {
  return Shop(
    json['id'] as int,
    json['name'] as String,
    json['store_code'] as String,
    json['owner_name'] as String,
    json['phone'] as String,
    json['lat'] as String,
    json['long'] as String,
  );
}

Map<String, dynamic> _$ShopToJson(Shop instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'store_code': instance.store_code,
      'owner_name': instance.owner_name,
      'phone': instance.phone,
      'lat': instance.lat,
      'long': instance.long,
    };
