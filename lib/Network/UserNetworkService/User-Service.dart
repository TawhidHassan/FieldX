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
      logger.d(response.body);
      return jsonDecode(response.body);
    } catch (e) {
      print(e);
      return null;
    }
  }

}