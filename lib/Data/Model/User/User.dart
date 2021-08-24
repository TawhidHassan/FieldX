
// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
part 'User.g.dart';

@JsonSerializable()
class User{
  @JsonKey(name: "_id")
  int id;

  String first_name;
  String last_name;
  String email;
  String organization_id;


  User(this.id, this.first_name, this.last_name, this.email,
      this.organization_id);

  factory User.fromJson(Map<String,dynamic>json)=>
      _$UserFromJson(json);
  Map<String,dynamic>toJson()=>_$UserToJson(this);
}