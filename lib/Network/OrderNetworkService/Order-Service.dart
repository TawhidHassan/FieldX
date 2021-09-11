import 'dart:convert';

import 'package:fieldx/Constants/Strings/appStrings.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class OrderNetwork {
  var logger = Logger();

  Future loadproduct(String token) async{
    try{
      final response=await get(Uri.parse(BASE_URL+"product/all-products/"),
        headers: {
          "Authorization":"Bearer "+token
        },

      );
      logger.d(response.body);
      return json.decode(response.body);
    }catch(err){
      logger.d(err.toString());
    }

  }

 Future saveOrder(String token, Map<String, dynamic> data)async {

   try{
     final response=await post(Uri.parse(BASE_URL+"order/store"),
       headers: {
         "Content-type": "application/json",
         "Accept":"application/json",
         "Authorization":"Bearer "+token,

       },
       body: json.encode(data),
     );
     logger.d(response.body);
     return json.decode(response.body);
   }catch(err){
     logger.d(err.toString());
   }
 }

 Future getOrder(String token) async{
   try{
     final response=await get(Uri.parse(BASE_URL+"order/sr-orders/"),
       headers: {
         "Content-type": "application/json",
         "Accept":"application/json",
         "Authorization":"Bearer "+token,
       },

     );
     logger.d(response.body);
     return json.decode(response.body);
   }catch(err){
     logger.d(err.toString());
   }

 }

  Future getOrderByShop(String token, int shopId) async{
    try{
      final response=await get(Uri.parse(BASE_URL+"order/products/store/"+shopId.toString()),
        headers: {
          "Content-type": "application/json",
          "Accept":"application/json",
          "Authorization":"Bearer "+token,
        },

      );
      logger.d(response.body);
      return json.decode(response.body);
    }catch(err){
      logger.d(err.toString());
    }
  }

  Future loadPendingOrder(String token, int routeId)async {
    try{
      final response=await get(Uri.parse(BASE_URL+"dp/order/stores/"+routeId.toString()),
        headers: {
          "Content-type": "application/json",
          "Accept":"application/json",
          "Authorization":"Bearer "+token,
        },

      );
      logger.d(response.body);
      return json.decode(response.body);
    }catch(err){
      logger.d(err.toString());
    }
  }

  Future loadPendingOrderDp(String token)async {
    try{
      final response=await get(Uri.parse("http://demo.fieldx.maacinfo.com/api/order/pendingOrders"),
        headers: {
          "Content-type": "application/json",
          "Accept":"application/json",
          "Authorization":"Bearer "+token,
        },

      );
      logger.d(response.body);
      return json.decode(response.body);
    }catch(err){
      logger.d(err.toString());
    }
  }

  Future orderDetails(String token, int orderId) async{
    try{
      final response=await get(Uri.parse(BASE_URL+"order/items/"+orderId.toString()),
        headers: {
          "Content-type": "application/json",
          "Accept":"application/json",
          "Authorization":"Bearer "+token,
        },

      );
      logger.d(response.body);
      return json.decode(response.body);
    }catch(err){
      logger.d(err.toString());
    }
  }

  Future updateOrderStatus(String token, int orderId)async {
    try{
      final response=await patch(Uri.parse(BASE_URL+"order/status/update/"+orderId.toString()),
        headers: {
          "Content-type": "application/json",
          "Accept":"application/json",
          "Authorization":"Bearer "+token,
        },

      );
      logger.d(response.body);
      return json.decode(response.body);
    }catch(err){
      logger.d(err.toString());
    }
  }


}