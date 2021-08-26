
// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
part 'Territory.g.dart';

@JsonSerializable()
class Territory{
  @JsonKey(name: "_id")
  int id;

  String name;
  String organization_id;


  Territory(this.id, this.name, this.organization_id);

  factory Territory.fromJson(Map<String,dynamic>json)=>
      _$TerritoryFromJson(json);
  Map<String,dynamic>toJson()=>_$TerritoryToJson(this);
}