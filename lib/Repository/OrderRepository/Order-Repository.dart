import 'package:fieldx/Data/DummyModel/ProductItem.dart';
import 'package:fieldx/Data/Model/Order/OrderDetailsData/OrderDetailsResponse.dart';
import 'package:fieldx/Data/Model/Order/OrderDpResponse.dart';
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
      List<ProductEx> itemX, int beforeDiscount, int discount, int afterDiscount,int vat, int grandTota,int userId,int dpId)async {

    Map<String, dynamic> data = {
      "sr_id":userId,
      "dp_id":dpId,
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

  Future<OrderResponse> getOrderByShop(String token, int shopId)async {
    final raw=await OrderNetwork().getOrderByShop(token,shopId);
    logger.d(raw);
    return OrderResponse.fromJson(raw);
  }

  Future<OrderDpResponse> loadPendingOrder(String token, int routeId) async{
    final raw=await OrderNetwork().loadPendingOrder(token,routeId);
    logger.d(raw);
    return OrderDpResponse.fromJson(raw);

  }

  Future<OrderDpResponse> loadPendingOrderDp(String token)async {
    final raw=await OrderNetwork().loadPendingOrderDp(token);
    logger.d(raw);
    return OrderDpResponse.fromJson(raw);
  }

  Future<OrderDetailsResponse> orderDetails(String token, int orderId) async{
    final raw=await OrderNetwork().orderDetails(token,orderId);
    logger.d(raw);
    return OrderDetailsResponse.fromJson(raw);
  }

  Future updateOrderStatus(String token, int orderId) async{
    final raw=await OrderNetwork().updateOrderStatus(token,orderId);
    logger.d(raw);
    return raw;
  }


}