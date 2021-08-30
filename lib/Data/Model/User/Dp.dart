
// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
part 'Dp.g.dart';

@JsonSerializable()
class Dp{

  String route_name;
  String dp_id;
  String dp_first_name;
  String dp_last_name;


  Dp(this.route_name, this.dp_id, this.dp_first_name, this.dp_last_name);

  factory Dp.fromJson(Map<String,dynamic>json)=>
      _$DpFromJson(json);
  Map<String,dynamic>toJson()=>_$DpToJson(this);
}