import 'package:json_annotation/json_annotation.dart';

import 'Shop.dart';
part 'ShopResponse.g.dart';

@JsonSerializable()
class ShopResponse{

  bool success;
  String message;
  List<Shop>data;


  ShopResponse(this.success, this.message, this.data);

  factory ShopResponse.fromJson(Map<String,dynamic>json)=>
      _$ShopResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$ShopResponseToJson(this);
}