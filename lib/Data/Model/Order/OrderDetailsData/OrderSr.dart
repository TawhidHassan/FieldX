
// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
part 'OrderSr.g.dart';

@JsonSerializable()
class OrderSr{

  String first_name;
  String last_name;


  OrderSr(this.first_name, this.last_name);

  factory OrderSr.fromJson(Map<String,dynamic>json)=>
      _$OrderSrFromJson(json);
  Map<String,dynamic>toJson()=>_$OrderSrToJson(this);
}