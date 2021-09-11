import 'package:fieldx/Data/Model/Route/RouteResponse.dart';
import 'package:fieldx/Data/Model/Shop/ShopResponse.dart';
import 'package:fieldx/Network/RouteNetworkService/Route-Service.dart';
import 'package:fieldx/Network/ShopNwtworkService/Shop-Service.dart';
import 'package:logger/logger.dart';

class ShopRepository {
  var logger = Logger();


  Future<ShopResponse> loadShopByRoute(int shopId,String token) async{
    final raw=await ShopNetwork().loadShopByRoute(shopId,token);
    logger.d(raw);
    return ShopResponse.fromJson(raw);
  }

  Future<ShopResponse> loadStoreDetails(int shopId, String token)async {
    final raw=await ShopNetwork().loadStoreDetails(shopId,token);
    logger.d(raw);
    return ShopResponse.fromJson(raw);
  }

}