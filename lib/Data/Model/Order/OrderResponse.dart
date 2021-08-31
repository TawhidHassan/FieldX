
// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import 'Order.dart';
part 'OrderResponse.g.dart';

@JsonSerializable()
class OrderResponse{

  bool success;
  String message;
  List<Order>data;


  OrderResponse(this.success, this.message, this.data);

  factory OrderResponse.fromJson(Map<String,dynamic>json)=>
      _$OrderResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$OrderResponseToJson(this);
}