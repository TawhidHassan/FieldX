
import 'package:json_annotation/json_annotation.dart';

import 'Dp.dart';
part 'DpResponse.g.dart';

@JsonSerializable()
class DpResponse{

  bool success;
  String message;
  List<Dp> data;
  DpResponse(this.success, this.message, this.data);

  factory DpResponse.fromJson(Map<String,dynamic>json)=>
      _$DpResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$DpResponseToJson(this);
}