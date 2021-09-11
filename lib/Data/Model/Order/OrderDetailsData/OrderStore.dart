
// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
part 'OrderStore.g.dart';

@JsonSerializable()
class OrderStore{

  String id;
  String name;
  String store_code;
  String owner_name;


  OrderStore(this.id, this.name, this.store_code, this.owner_name);

  factory OrderStore.fromJson(Map<String,dynamic>json)=>
      _$OrderStoreFromJson(json);
  Map<String,dynamic>toJson()=>_$OrderStoreToJson(this);
}