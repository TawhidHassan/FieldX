import 'dart:convert';

import 'package:fieldx/Constants/Strings/appStrings.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class RouteNetwork {
  var logger = Logger();

  Future loadRouteForUser(int userId, String token) async{
    try{
      final response=await get(Uri.parse(BASE_URL+"geo/routes/sr/"+userId.toString()),
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