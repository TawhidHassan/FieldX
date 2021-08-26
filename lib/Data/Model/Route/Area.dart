
// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
part 'Area.g.dart';

@JsonSerializable()
class Area{
  @JsonKey(name: "_id")
  int id;

  String name;
  String organization_id;


  Area(this.id, this.name, this.organization_id);

  factory Area.fromJson(Map<String,dynamic>json)=>
      _$AreaFromJson(json);
  Map<String,dynamic>toJson()=>_$AreaToJson(this);
}