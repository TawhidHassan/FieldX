import 'package:bloc/bloc.dart';
import 'package:fieldx/Data/Model/Login/Login.dart';
import 'package:fieldx/Data/Model/User/DpResponse.dart';
import 'package:fieldx/Repository/UserRepository/User-Repository.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  var logger = Logger();
  UserCubit() : super(UserInitial());
  Login valuex;
  void logIn(String email, String password, String device) {
    UserRepository().loginUser(email, password,device).then((value) => {
      logger.d(value),
      if(value['message']!="The given data was invalid."){
        // logger.d(value),
        // logger.d(value.token),
        valuex= Login.fromJson(value),
        emit(LoginSuccessful(login: valuex))
      }else{
        emit(LoginSuccessful(login: null))
      }
    });
  }

  void loadDpUsers(String token, int routeId) {
    UserRepository().loadDpUsers(token, routeId).then((value) => {
      logger.d(value),
      if(value!=null){
        // logger.d(value),
        // logger.d(value.token),
        emit(DpUserGet(dpResponse: value))
      }
    });
  }
}
