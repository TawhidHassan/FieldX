
// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
part 'Cetegory.g.dart';

@JsonSerializable()
class Cetegory{

  int id;
  String name;
  String short_description;
  String organization_id;


  Cetegory(this.id, this.name, this.short_description, this.organization_id);

  factory Cetegory.fromJson(Map<String,dynamic>json)=>
      _$CetegoryFromJson(json);
  Map<String,dynamic>toJson()=>_$CetegoryToJson(this);
}