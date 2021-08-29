import 'package:fieldx/Bloc/Product/product_cubit.dart';
import 'package:fieldx/Bloc/Shop/shop_cubit.dart';
import 'package:fieldx/Constants/Strings/appStrings.dart';
import 'package:fieldx/Data/Model/Product/Product.dart';
import 'package:fieldx/Presentation/Widgets/Card/Producard/ProductCard.dart';
import 'package:fieldx/Presentation/Widgets/Card/RouteCard/RouteCard.dart';
import 'package:fieldx/Presentation/Widgets/Card/ShopCard/ShopCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';

class ProductDetails extends StatefulWidget {
  final int shopId;
  final int productId;
  final String heroTag;
  final String image;
  final Product product;
  const ProductDetails({Key key, this.shopId, this.productId, this.heroTag, this.image, this.product}) : super(key: key);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

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
      appBar: AppBar(title: Text(widget.product.name+" Details"),),
      body: Material(
        elevation: 30.0,
        shadowColor: Colors.grey,
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(left: 0,right:0,top: 0),
          child: Padding(
            padding: EdgeInsets.all(14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Hero(
                        tag: widget.heroTag,
                        child: Image.network(BASE_URL_image+widget.image,height: 100,width: 100,)
                    ),
                    Text(widget.product.name+"("+widget.product.code+")",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                  ],
                ),
                Row(
                  children: [
                    Text("Model No: "+widget.product.model_no,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                  ],
                ),
                Row(
                  children: [
                    Text("Brand: "+widget.product.brand.name,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),),
                    SizedBox(width: 10,),
                    Text("category: "+widget.product.category.name,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text("Unit Price: "+widget.product.unit_price,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),),
                    SizedBox(width: 10,),
                    Text("Discount: "+widget.product.max_discount,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text("Unit: "+widget.product.unit.name,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
