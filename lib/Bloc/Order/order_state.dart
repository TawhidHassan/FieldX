part of 'order_cubit.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}

class OerderSave extends OrderState{
  final String status;

  OerderSave({this.status});
}

class OrderGet extends OrderState{
  final String data;

  OrderGet(this.data);
}