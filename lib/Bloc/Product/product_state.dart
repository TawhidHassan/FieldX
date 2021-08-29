part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class GetProduct extends ProductState{
  final ProductResponse productResponse;

  GetProduct({this.productResponse});
}
