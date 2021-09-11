
// ignore_for_file: file_names
import 'package:fieldx/Data/Model/Order/OrderDp.dart';
import 'package:json_annotation/json_annotation.dart';
part 'OrderDpResponse.g.dart';

@JsonSerializable()
class OrderDpResponse{

  bool success;
  String message;
  List<OrderDp>data;


  OrderDpResponse(this.success, this.message, this.data);

  factory OrderDpResponse.fromJson(Map<String,dynamic>json)=>
      _$OrderDpResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$OrderDpResponseToJson(this);
}