import 'package:fieldx/Data/Model/Route/RouteResponse.dart';
import 'package:fieldx/Network/RouteNetworkService/Route-Service.dart';
import 'package:logger/logger.dart';

class RouteRepository {
  var logger = Logger();

  Future<RouteResponse> loadRouteForUser(int userId, String token)async {
    final raw=await RouteNetwork().loadRouteForUser(userId,token);
    logger.d(raw);
    return RouteResponse.fromJson(raw);
  }

  Future<RouteResponse> loadRouteForDP(String token)async {
    final raw=await RouteNetwork().loadRouteForDP(token);
    logger.d(raw);
    return RouteResponse.fromJson(raw);
  }
}