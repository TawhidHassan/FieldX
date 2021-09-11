
// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';

import 'OrderDetails.dart';

part 'OrderDetailsResponse.g.dart';

@JsonSerializable()
class OrderDetailsResponse{

 bool success;
 String message;
 OrderDetails data;


 OrderDetailsResponse(this.success, this.message, this.data);

  factory OrderDetailsResponse.fromJson(Map<String,dynamic>json)=>
      _$OrderDetailsResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$OrderDetailsResponseToJson(this);
}