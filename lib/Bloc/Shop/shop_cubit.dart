import 'package:bloc/bloc.dart';
import 'package:fieldx/Data/Model/Shop/ShopResponse.dart';
import 'package:fieldx/Repository/ShopRepository/Shope-Repository.dart';
import 'package:meta/meta.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitial());

  void loadShopByRoute(int shopId,String token) {
    ShopRepository().loadShopByRoute(shopId,token).then((value) => {
      if(value!=null){
        emit(GetShop(shopResponse: value))
      }
    });
  }

  void loadStoreDetails(int shopId,String token) {
    ShopRepository().loadStoreDetails(shopId,token).then((value) => {
      if(value!=null){
        emit(GetShop(shopResponse: value))
      }
    });
  }
}
