
// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
part 'Role.g.dart';

@JsonSerializable()
class Role{

  String role_id;
  String role_name;
  String org_name;


  Role(this.role_id, this.role_name, this.org_name);

  factory Role.fromJson(Map<String,dynamic>json)=>
      _$RoleFromJson(json);
  Map<String,dynamic>toJson()=>_$RoleToJson(this);
}