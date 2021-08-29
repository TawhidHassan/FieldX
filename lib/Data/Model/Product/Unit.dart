
// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
part 'Unit.g.dart';

@JsonSerializable()
class Unit{

  int id;
  String name;
  String short_name;
  String organization_id;


  Unit(this.id, this.name, this.short_name, this.organization_id);

  factory Unit.fromJson(Map<String,dynamic>json)=>
      _$UnitFromJson(json);
  Map<String,dynamic>toJson()=>_$UnitToJson(this);
}