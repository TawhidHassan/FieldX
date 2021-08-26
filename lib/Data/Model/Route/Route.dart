
// ignore_for_file: file_names


import 'package:fieldx/Data/Model/User/User.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Area.dart';
import 'Region.dart';
import 'Territory.dart';
part 'Route.g.dart';

@JsonSerializable()
class Route{
  @JsonKey(name: "_id")
  int id;

  String name;
  String organization_id;

  Territory territory;
  Area area;
  Region region;
  User sr;
  User dp;


  Route(this.id, this.name, this.organization_id, this.territory, this.area,
      this.region, this.sr, this.dp);

  factory Route.fromJson(Map<String,dynamic>json)=>
      _$RouteFromJson(json);
  Map<String,dynamic>toJson()=>_$RouteToJson(this);
}