part of 'shop_cubit.dart';

@immutable
abstract class ShopState {}

class ShopInitial extends ShopState {}

class GetShop extends ShopState{
  final ShopResponse shopResponse;

  GetShop({this.shopResponse});
}
