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


}