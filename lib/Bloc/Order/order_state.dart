part of 'order_cubit.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}

class OerderSave extends OrderState{
  final String status;

  OerderSave({this.status});
}

class OrderGet extends OrderState{
  final OrderResponse orderResponse;

  OrderGet({this.orderResponse});
}

class DpPendingOrderGet extends OrderState{
  final OrderDpResponse orderDpResponse;

  DpPendingOrderGet({this.orderDpResponse});
}


class GetOrderDetails extends OrderState{
  final OrderDetailsResponse orderDetailsResponse;

  GetOrderDetails({this.orderDetailsResponse});
}

class UpdateOrder extends OrderState{
  final String status;

  UpdateOrder({this.status});
}