import 'package:fieldx/Data/DummyModel/ProductItem.dart';
import 'package:fieldx/Data/Model/Order/OrderResponse.dart';
import 'package:fieldx/Data/Model/Product/ProductResponse.dart';
import 'package:fieldx/Data/Model/Route/RouteResponse.dart';
import 'package:fieldx/Data/Model/Shop/ShopResponse.dart';
import 'package:fieldx/Network/OrderNetworkService/Order-Service.dart';
import 'package:fieldx/Network/ProductNetworkService/Product-Service.dart';
import 'package:fieldx/Network/RouteNetworkService/Route-Service.dart';
import 'package:fieldx/Network/ShopNwtworkService/Shop-Service.dart';
import 'package:logger/logger.dart';

class OrderRepository {
  var logger = Logger();



  Future saveOrder(String token, int routeId, int shopId, String name, String dp_first_name, String dateIn, String deliveryDate,
      List<ProductEx> itemX, int beforeDiscount, int discount, int afterDiscount,int vat, int grandTota)async {

    Map<String, dynamic> data = {
      "sr_name":name,
      "dp_name": dp_first_name,
      "order_date": dateIn,
      "delivery_date": deliveryDate,
      "route_id": routeId,
      "store_id": shopId,
      "order_details": itemX,
      "total_before_discount": beforeDiscount,
      "discount": discount,
      "total_after_discount": afterDiscount,
      "vat": vat,
      "grand_total": grandTota,
    };

    final raw=await OrderNetwork().saveOrder(token,data);
    logger.d(raw);
    return raw;
  }

  Future<OrderResponse> getOrder(String token) async{
    final raw=await OrderNetwork().getOrder(token);
    logger.d(raw);
    return OrderResponse.fromJson(raw);
  }


}