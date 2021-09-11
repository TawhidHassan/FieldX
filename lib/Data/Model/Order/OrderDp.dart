
// ignore_for_file: file_names

import 'package:fieldx/Data/Model/Shop/Shop.dart';
import 'package:json_annotation/json_annotation.dart';
part 'OrderDp.g.dart';

@JsonSerializable()
class OrderDp{

  int id;
  String order_id;
  String sr_name;
  String dp_name;
  String order_date;
  String route_id;
  String store_id;
  String total_before_discount;
  String total_after_discount;
  String discount;
  String vat;
  String grand_total;
  String user_id;
  String organization_id;
  String status;
  String product_id;
  String quantity;
  String unit_price;
  String sub_total;
  Shop store;


  OrderDp(
      this.id,
      this.order_id,
      this.sr_name,
      this.dp_name,
      this.order_date,
      this.route_id,
      this.store_id,
      this.total_before_discount,
      this.total_after_discount,
      this.discount,
      this.vat,
      this.grand_total,
      this.user_id,
      this.organization_id,
      this.status,
      this.product_id,
      this.quantity,
      this.unit_price,
      this.sub_total,
      this.store);

  factory OrderDp.fromJson(Map<String,dynamic>json)=>
      _$OrderDpFromJson(json);
  Map<String,dynamic>toJson()=>_$OrderDpToJson(this);
}