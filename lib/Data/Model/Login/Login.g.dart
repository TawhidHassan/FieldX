// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) {
  return Login(
    json['token'] as String,
    User.fromJson(json['user'] as Map<String, dynamic>),
    (json['roles'] as List<dynamic>)
        .map((e) => Role.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
      'roles': instance.roles,
    };
