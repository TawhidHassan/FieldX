import 'package:bloc/bloc.dart';
import 'package:fieldx/Data/Model/Product/ProductResponse.dart';
import 'package:fieldx/Repository/ProductRepository/Product-Repository.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  void loadproduct(String token) {
    ProductRepository().loadproduct(token).then((value) => {
      if(value!=null){
        emit(GetProduct(productResponse: value))
      }
    });
  }
}
