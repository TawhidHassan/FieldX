part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class LoginSuccessful extends UserState {
  final Login login;
  LoginSuccessful({this.login});
}

class DpUserGet extends UserState {
  final DpResponse dpResponse;
  DpUserGet({this.dpResponse});
}