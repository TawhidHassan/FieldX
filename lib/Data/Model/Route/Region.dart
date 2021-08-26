
// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
part 'Region.g.dart';

@JsonSerializable()
class Region{
  @JsonKey(name: "_id")
  int id;

  String name;
  String organization_id;


  Region(this.id, this.name, this.organization_id);

  factory Region.fromJson(Map<String,dynamic>json)=>
      _$RegionFromJson(json);
  Map<String,dynamic>toJson()=>_$RegionToJson(this);
}