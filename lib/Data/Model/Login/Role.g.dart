// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Role _$RoleFromJson(Map<String, dynamic> json) {
  return Role(
    json['role_id'] as String,
    json['role_name'] as String,
    json['org_name'] as String,
  );
}

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
      'role_id': instance.role_id,
      'role_name': instance.role_name,
      'org_name': instance.org_name,
    };
