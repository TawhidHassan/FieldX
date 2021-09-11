part of 'route_cubit.dart';

@immutable
abstract class RouteState {}

class RouteInitial extends RouteState {}

class GetRoute extends RouteState{
  final RouteResponse routeResponse;

  GetRoute({this.routeResponse});
}

class GetDpRoute extends RouteState{
  final RouteResponse routeResponse;

  GetDpRoute({this.routeResponse});
}