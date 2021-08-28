
// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import 'Route.dart';
part 'RouteResponse.g.dart';

@JsonSerializable()
class RouteResponse{

  bool success;
  String message;
  List<Route> data;


  RouteResponse(this.success, this.message, this.data);

  factory RouteResponse.fromJson(Map<String,dynamic>json)=>
      _$RouteResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$RouteResponseToJson(this);
}