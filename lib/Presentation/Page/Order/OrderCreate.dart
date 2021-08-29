import 'package:fieldx/Bloc/Product/product_cubit.dart';
import 'package:fieldx/Bloc/Shop/shop_cubit.dart';
import 'package:fieldx/Constants/Strings/appStrings.dart';
import 'package:fieldx/Presentation/Widgets/Card/Producard/ProductCard.dart';
import 'package:fieldx/Presentation/Widgets/Card/RouteCard/RouteCard.dart';
import 'package:fieldx/Presentation/Widgets/Card/ShopCard/ShopCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';

class OrderCreate extends StatefulWidget {
  final int shopId;
  final int productId;
  final String heroTag;
  final String image;
  const OrderCreate({Key key, this.shopId, this.productId, this.heroTag, this.image}) : super(key: key);
  @override
  _OrderCreateState createState() => _OrderCreateState();
}

class _OrderCreateState extends State<OrderCreate> {

  String token;
  void getData() async{
    var users= await Hive.openBox('users');
    print("hive "+users.get('userId').toString());
    if (users.get('token') != null) {
      setState(() {
        token=users.get('token');
        BlocProvider.of<ProductCubit>(context).loadproduct(token);
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Order Create"),),
      body: Material(
        elevation: 30.0,
        shadowColor: Colors.grey,
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(left: 0,right:0,top: 0),
          child: Column(
            children: [
              SizedBox(height:3,),
                Center(
                  child:  Hero(
                      tag: widget.heroTag,
                      child: Image.network(BASE_URL_image+widget.image)
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
