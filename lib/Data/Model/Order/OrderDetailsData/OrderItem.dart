
// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
part 'OrderItem.g.dart';

@JsonSerializable()
class OrderItem{

  String quantity;
  String unit_price;
  String sub_total;


  OrderItem(this.quantity, this.unit_price, this.sub_total);

  factory OrderItem.fromJson(Map<String,dynamic>json)=>
      _$OrderItemFromJson(json);
  Map<String,dynamic>toJson()=>_$OrderItemToJson(this);
}