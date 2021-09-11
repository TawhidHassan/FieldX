import 'package:bloc/bloc.dart';
import 'package:fieldx/Data/DummyModel/ProductItem.dart';
import 'package:fieldx/Data/Model/Order/OrderDetailsData/OrderDetailsResponse.dart';
import 'package:fieldx/Data/Model/Order/OrderDpResponse.dart';
import 'package:fieldx/Data/Model/Order/OrderResponse.dart';
import 'package:fieldx/Repository/OrderRepository/Order-Repository.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  Logger logger=Logger();
  OrderCubit() : super(OrderInitial());

  void saveOrder(String token, int routeId, int shopId, String name, String dp_first_name,
      String dateIn, String deliveryDate, List<ProductEx> itemX,
      int beforeDiscount, int discount, int afterDiscount,int vat, int grandTota,int userId,int dpId) {
    OrderRepository().saveOrder(token,routeId,shopId,name,dp_first_name,dateIn,deliveryDate,itemX,beforeDiscount,discount,afterDiscount,vat,grandTota,userId,dpId).then((value) =>
    {
      if(value!=null){
        emit(OerderSave(status:value ))
      }

    });
  }

  void getOrder(String token){
    OrderRepository().getOrder(token).then((value) => {
      if(value!=null){
        emit(OrderGet(orderResponse: value))
      }
    });
  }

  void getOrderByShop(String token, int shopId) {
    OrderRepository().getOrderByShop(token,shopId).then((value) => {
      if(value!=null){
        emit(OrderGet(orderResponse: value))
      }
    });
  }

  void loadPendingOrder(int routeId, String token) {
    OrderRepository().loadPendingOrder(token,routeId).then((value) => {
      logger.d(value),
      if(value!=null){
        emit(DpPendingOrderGet(orderDpResponse: value))
      }
    });
  }

  void loadPendingOrderDp(String token) {
    OrderRepository().loadPendingOrderDp(token).then((value) => {
      logger.d(value),
      if(value!=null){
        emit(DpPendingOrderGet(orderDpResponse: value))
      }
    });
  }

  void orderDetails(int orderId, String token) {
    OrderRepository().orderDetails(token,orderId).then((value) => {
      if(value!=null){
        emit(GetOrderDetails(orderDetailsResponse: value))
      }
    });
  }

  void updateOrderStatus(int orderId, String token) {
    OrderRepository().updateOrderStatus(token,orderId).then((value) => {
      if(value!=null){
        emit(UpdateOrder(status:"done"))
      }
    });
  }


}
