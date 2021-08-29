import 'package:fieldx/Data/Model/Product/ProductResponse.dart';
import 'package:fieldx/Data/Model/Route/RouteResponse.dart';
import 'package:fieldx/Data/Model/Shop/ShopResponse.dart';
import 'package:fieldx/Network/ProductNetworkService/Product-Service.dart';
import 'package:fieldx/Network/RouteNetworkService/Route-Service.dart';
import 'package:fieldx/Network/ShopNwtworkService/Shop-Service.dart';
import 'package:logger/logger.dart';

class ProductRepository {
  var logger = Logger();

  Future<ProductResponse> loadproduct(String token) async{
    final raw=await ProductNetwork().loadproduct(token);
    logger.d(raw);
    return ProductResponse.fromJson(raw);
  }


}