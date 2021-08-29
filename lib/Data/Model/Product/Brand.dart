
// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
part 'Brand.g.dart';

@JsonSerializable()
class Brand{

  int id;
  String name;
  String short_description;
  String organization_id;


  Brand(this.id, this.name, this.short_description, this.organization_id);

  factory Brand.fromJson(Map<String,dynamic>json)=>
      _$BrandFromJson(json);
  Map<String,dynamic>toJson()=>_$BrandToJson(this);
}