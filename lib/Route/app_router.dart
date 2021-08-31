import 'package:fieldx/Bloc/Order/order_cubit.dart';
import 'package:fieldx/Bloc/Product/product_cubit.dart';
import 'package:fieldx/Bloc/User/user_cubit.dart';
import 'package:fieldx/Constants/Strings/appStrings.dart';
import 'package:fieldx/Presentation/Page/Home/HomePage.dart';
import 'package:fieldx/Presentation/Page/Order/OrderCreate.dart';
import 'package:fieldx/Presentation/Page/Order/OrdersShow.dart';
import 'package:fieldx/Presentation/Page/Order/StoreSlectPage.dart';
import 'package:fieldx/Presentation/Page/Product/Product.dart';
import 'package:fieldx/Presentation/Page/Product/ProductDetails.dart';
import 'package:fieldx/Presentation/Page/Product/ProductShow.dart';
import 'package:fieldx/Presentation/Page/Shop/Shops.dart';
import 'package:fieldx/Presentation/Screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments as Map;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case HOME_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => UserCubit(),
              child: HomePage(),
            ));
      case SHOP_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => UserCubit(),
              child: Shops(shopId: arguments['shopId'],),
            ));
      case SHOP_SELECT_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => UserCubit(),
              child: ShopSelect(shopId: arguments['shopId'],),
            ));
      case PRODUCT_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => ProductCubit(),
              child: Products(shopId: arguments['shopId'],),
            ));
      case PRODUCT_LIST_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => ProductCubit(),
              child: ProductShow(),
            ));
      case ORDER_TAKE_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => OrderCubit(),
              child: OrderCreate(
                  shopId: arguments['shopId'],
                  routeId:arguments['routeId']
              ),
            ));
      case ORDER_SHOW_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => OrderCubit(),
              child: OrderShows(),
            ));
      case PRODUCT_DETAILS_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => OrderCubit(),
              child: ProductDetails(
                shopId: arguments['shopId'],
                productId: arguments['productId'],
                heroTag: arguments['heroTag'],
                image: arguments['image'],
                product: arguments['product'],
              ),
            ));

      default:
        return null;
    }
  }
}
