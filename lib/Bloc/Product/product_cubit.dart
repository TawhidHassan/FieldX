import 'package:bloc/bloc.dart';
import 'package:fieldx/Data/Model/Product/ProductResponse.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
}
