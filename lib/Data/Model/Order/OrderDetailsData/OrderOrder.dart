
// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
part 'OrderOrder.g.dart';

@JsonSerializable()
class OrderOrder{

  String id;
  String order_date;
  String delivery_date;
  String total_before_discount;
  String total_after_discount;
  String discount;
  String vat;
  String grand_total;
  String status;


  OrderOrder(
      this.id,
      this.order_date,
      this.delivery_date,
      this.total_before_discount,
      this.total_after_discount,
      this.discount,
      this.vat,
      this.grand_total,
      this.status);

  factory OrderOrder.fromJson(Map<String,dynamic>json)=>
      _$OrderOrderFromJson(json);
  Map<String,dynamic>toJson()=>_$OrderOrderToJson(this);
}