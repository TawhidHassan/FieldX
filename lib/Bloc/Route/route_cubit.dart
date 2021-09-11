import 'package:bloc/bloc.dart';
import 'package:fieldx/Data/Model/Route/RouteResponse.dart';
import 'package:fieldx/Repository/RouteRepository/Route-Repository.dart';
import 'package:meta/meta.dart';

part 'route_state.dart';

class RouteCubit extends Cubit<RouteState> {
  RouteCubit() : super(RouteInitial());

  void loadRouteForUser(int userId, String token) {
    RouteRepository().loadRouteForUser(userId,token).then((value) => {
      if(value!=null){
        emit(GetRoute(routeResponse: value))
      }
    });
  }

  void loadRouteForDP(String token) {
    RouteRepository().loadRouteForDP(token).then((value) => {
      if(value!=null){
        emit(GetDpRoute(routeResponse: value))
      }
    });
  }
}
