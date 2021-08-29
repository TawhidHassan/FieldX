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

class Products extends StatefulWidget {
  final int shopId;

  const Products({Key key, this.shopId}) : super(key: key);
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

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
      appBar: AppBar(title: Text("Products"),),
      body: Material(
        elevation: 30.0,
        shadowColor: Colors.grey,
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(left: 0,right:0,top: 0),
          child: Column(
            children: [
              SizedBox(height:3,),
              Flexible(
                flex:100,
                child: BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    if(!(state is GetProduct)){
                      return Center(child: CircularProgressIndicator(),);
                    }
                    final data=(state as GetProduct).productResponse;
                    return Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child:  Column(
                            children: [
                              data.data.isEmpty? Column(
                                children: [
                                  SizedBox(
                                      height: 200,
                                      width: 200,
                                      child: Lottie.asset('assets/lottie/empty.json')
                                  ),
                                  Text(("No data found")),
                                ],
                              ):
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.9,
                                child: ListView(
                                    physics:
                                    BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                    children:  data.data.map((data) =>  Container(
                                      margin: EdgeInsets.only(bottom: 14),
                                      child:  InkWell(
                                          onTap: (){
                                            Navigator.pushNamed(context, PRODUCT_DETAILS_PAGE, arguments: {
                                              'shopId':widget.shopId,
                                              'productId':data.id,
                                              'heroTag':data.image+data.code,
                                              'image':data.image,
                                              'product':data
                                            });
                                          },
                                          child: ProductCard(name: data.name,code: data.code,category:data.category.name,image: data.image,brand: data.brand.name,model_no: data.model_no,unit_price: data.unit_price,),
                                      ),
                                    )
                                    ).toList()
                                ),
                              )

                            ],
                          )
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
