
// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
part 'Shop.g.dart';

@JsonSerializable()
class Shop{
  int id;
  String name;
  String store_code;
  String owner_name;
  String phone;
  String lat;
  String long;


  Shop(this.id, this.name, this.store_code, this.owner_name, this.phone,
      this.lat, this.long);

  factory Shop.fromJson(Map<String,dynamic>json)=>
      _$ShopFromJson(json);
  Map<String,dynamic>toJson()=>_$ShopToJson(this);
}