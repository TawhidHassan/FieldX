import 'dart:convert';

import 'package:fieldx/Constants/Strings/appStrings.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class ProductNetwork {
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


}