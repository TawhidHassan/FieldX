
// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Brand.dart';
import 'Cetegory.dart';
import 'Unit.dart';
part 'Product.g.dart';

@JsonSerializable()
class Product{
  int id;
  String name;
  String code;
  String model_no;
  String unit_price;
  String max_discount;
  String image;

  Cetegory category;
  Brand brand;
  Unit unit;


  Product(this.id, this.name, this.code, this.model_no, this.unit_price,
      this.max_discount, this.image, this.category, this.brand, this.unit);

  factory Product.fromJson(Map<String,dynamic>json)=>
      _$ProductFromJson(json);
  Map<String,dynamic>toJson()=>_$ProductToJson(this);
}