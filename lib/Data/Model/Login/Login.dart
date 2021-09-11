
// ignore_for_file: file_names


import 'package:fieldx/Data/Model/User/User.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Role.dart';

part 'Login.g.dart';

@JsonSerializable()
class Login{

  String token;
  User user;
  List<Role> roles;


  Login(this.token, this.user, this.roles);

  factory Login.fromJson(Map<String,dynamic>json)=>
      _$LoginFromJson(json);
  Map<String,dynamic>toJson()=>_$LoginToJson(this);
}