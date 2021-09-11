
// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
part 'OrderProduct.g.dart';

@JsonSerializable()
class OrderProduct{

  String id;
  String name;
  String model_no;
  String unit_price;
  String max_discount;
  String image;


  OrderProduct(this.id, this.name, this.model_no, this.unit_price,
      this.max_discount, this.image);

  factory OrderProduct.fromJson(Map<String,dynamic>json)=>
      _$OrderProductFromJson(json);
  Map<String,dynamic>toJson()=>_$OrderProductToJson(this);
}