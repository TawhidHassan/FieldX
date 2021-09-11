
// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';

import 'OrderDpName.dart';
import 'OrderOrder.dart';
import 'OrderProduct.dart';
import 'OrderSr.dart';
import 'OrderStore.dart';
part 'OrderDetails.g.dart';

@JsonSerializable()
class OrderDetails{

  List<OrderOrder>order;
  List<OrderProduct>products;
  List<OrderStore>store;
  List<OrderSr>sr_name;
  List<OrderDpName>dp_name;


  OrderDetails(
      this.order, this.products, this.store, this.sr_name, this.dp_name);

  factory OrderDetails.fromJson(Map<String,dynamic>json)=>
      _$OrderDetailsFromJson(json);
  Map<String,dynamic>toJson()=>_$OrderDetailsToJson(this);
}