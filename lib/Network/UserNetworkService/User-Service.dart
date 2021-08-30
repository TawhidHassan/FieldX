// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';

import 'package:fieldx/Constants/Strings/appStrings.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class UserNetwork {
  var logger = Logger();

  Future<Map> login(Map<String,String> map)async {
    try {
      var response = await http.post(
        Uri.parse(BASE_URL + "auth/signin"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json"
        },
        body: json.encode(map),
      );
      // logger.d(response.body);
      return jsonDecode(response.body);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future loadDpUsers(String token, int routeId) async{
    try{
      final response=await get(Uri.parse(BASE_URL+"dp/route/"+routeId.toString()),
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