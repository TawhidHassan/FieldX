import 'package:bloc/bloc.dart';
import 'package:fieldx/Data/DummyModel/ProductItem.dart';
import 'package:fieldx/Repository/OrderRepository/Order-Repository.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  void saveOrder(String token, int routeId, int shopId, String name, String dp_first_name,
      String dateIn, String deliveryDate, List<ProductEx> itemX,
      int beforeDiscount, int discount, int afterDiscount,int vat, int grandTota) {
    OrderRepository().saveOrder(token,routeId,shopId,name,dp_first_name,dateIn,deliveryDate,itemX,beforeDiscount,discount,afterDiscount,vat,grandTota).then((value) =>
    {
      if(value!=null){
        emit(OerderSave(status:value ))
      }

    });
  }

  void getOrder(){

  }
}
