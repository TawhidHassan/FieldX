
// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
part 'OrderDpName.g.dart';

@JsonSerializable()
class OrderDpName{

  String first_name;
  String last_name;


OrderDpName(this.first_name, this.last_name);

  factory OrderDpName.fromJson(Map<String,dynamic>json)=>
      _$OrderDpNameFromJson(json);
  Map<String,dynamic>toJson()=>_$OrderDpNameToJson(this);
}