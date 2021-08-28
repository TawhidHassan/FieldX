// ignore: unused_import
// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';

import 'package:fieldx/Data/Model/Login/Login.dart';
import 'package:fieldx/Network/UserNetworkService/User-Service.dart';
import 'package:logger/logger.dart';

class UserRepository {
  var logger = Logger();

  Future loginUser(String userid,String password,String device) async {
    Map<String, String> data = {
      "email":userid,
      "password": password,
      "device_name": device,
    };
    final userRaw=await UserNetwork().login(data);
    // logger.d(userRaw['success']);

    if (userRaw == null) return null;

    // Login login=Login.fromJson(userRaw);

    // print(userRaw);
    return userRaw;
  }

}