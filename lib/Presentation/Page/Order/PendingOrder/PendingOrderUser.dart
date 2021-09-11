import 'package:fieldx/Bloc/Order/order_cubit.dart';
import 'package:fieldx/Bloc/Route/route_cubit.dart';
import 'package:fieldx/Constants/Strings/appStrings.dart';
import 'package:fieldx/Presentation/Widgets/Card/Order/MySalesCard.dart';
import 'package:fieldx/Presentation/Widgets/Card/Order/PendingOrder.dart';
import 'package:fieldx/Presentation/Widgets/Card/RouteCard/RouteCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';

class PendingOrderByUserId extends StatefulWidget {
  @override
  _PendingOrderByUserIdState createState() => _PendingOrderByUserIdState();
}

class _PendingOrderByUserIdState extends State<PendingOrderByUserId> {

  int userId;
  String token;
  String userName;
  void getData() async{
    var users= await Hive.openBox('users');
    if (users.get('token') != null) {
      setState(() {
        userName=users.get('name');
        userId=users.get('userId');
        token=users.get('token');
        BlocProvider.of<OrderCubit>(context).loadPendingOrderDp(token);
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    getData();
    // getCureentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pending Orders"),
      ),
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
                child: BlocBuilder<OrderCubit, OrderState>(
                  builder: (context, state) {
                    if(!(state is DpPendingOrderGet)){
                      return Center(child: CircularProgressIndicator(),);
                    }
                    final data=(state as DpPendingOrderGet).orderDpResponse;
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
                                      height: 300,
                                      width: 300,
                                      child: Lottie.asset('assets/lottie/empty.json')
                                  ),
                                  Text(("No data found")),
                                ],
                              ):
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.8,
                                child: ListView(
                                    physics:
                                    BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                    children:  data.data.map((data) =>  Container(
                                      margin: EdgeInsets.only(bottom: 14),
                                      child:  InkWell(
                                          onTap: (){
                                              Navigator.pushNamed(context, ORDER_PENDING_DETAILS_PAGE,arguments: {
                                                "orderId":data.id
                                              });
                                          },
                                          child: PendingOrderCard(dp:userName,date: data.order_date,productName: "",
                                            quantity: data.quantity,customername:userName,price: data.grand_total,
                                            deliveryDate: data.order_date,
                                            remark: "",
                                            customerEmail: "",
                                            employ: "",
                                            storeName: "",
                                            status: data.status,
                                          )),
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
