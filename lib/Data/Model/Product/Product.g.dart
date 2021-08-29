// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    json['id'] as int,
    json['name'] as String,
    json['code'] as String,
    json['model_no'] as String,
    json['unit_price'] as String,
    json['max_discount'] as String,
    json['image'] as String,
    Cetegory.fromJson(json['category'] as Map<String, dynamic>),
    Brand.fromJson(json['brand'] as Map<String, dynamic>),
    Unit.fromJson(json['unit'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'model_no': instance.model_no,
      'unit_price': instance.unit_price,
      'max_discount': instance.max_discount,
      'image': instance.image,
      'category': instance.category,
      'brand': instance.brand,
      'unit': instance.unit,
    };
