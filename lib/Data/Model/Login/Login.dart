
// ignore_for_file: file_names

import 'package:fieldx/Data/Model/User/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Login.g.dart';

@JsonSerializable()
class Login{

  String token;
  User user;


  Login(this.token, this.user);

  factory Login.fromJson(Map<String,dynamic>json)=>
      _$LoginFromJson(json);
  Map<String,dynamic>toJson()=>_$LoginToJson(this);
}