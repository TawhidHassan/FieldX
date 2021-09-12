import 'package:fieldx/Bloc/Order/order_cubit.dart';
import 'package:fieldx/Constants/Colors/constants.dart';
import 'package:fieldx/Constants/Strings/appStrings.dart';
import 'package:fieldx/Presentation/Widgets/Button/ShadowCurvedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class PendingOrderDetails extends StatefulWidget {
  final int orderId;

  const PendingOrderDetails({Key key, this.orderId}) : super(key: key);

  @override
  _PendingOrderDetailsState createState() => _PendingOrderDetailsState();
}

class _PendingOrderDetailsState extends State<PendingOrderDetails> {


  int userId;
  String token;
  String userName;
  bool circuler=false;

  void getData() async {
    var users = await Hive.openBox('users');
    print("hive " + users.get('userId').toString());
    if (users.get('token') != null) {
      setState(() {
        userId = users.get('userId');
        userName = users.get('name');
        token = users.get('token');
        BlocProvider.of<OrderCubit>(context).orderDetails(
            widget.orderId, token);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderCubit, OrderState>(
      listener: (context, state) {
       if(state is UpdateOrder){
         setState(() {
           circuler=false;
         });
         Navigator.pop(context);
       }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Order Details"),
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              if(!(state is GetOrderDetails)){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final data=(state as GetOrderDetails).orderDetailsResponse;
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Order: "+data.data.order[0].status,style: TextStyle(fontSize: 22,
                            fontWeight: FontWeight.bold),),
                        Text("Delivery Date: "+data.data.order[0].delivery_date,style: TextStyle(fontSize: 14,
                            fontWeight: FontWeight.w300)),
                      ],
                    )
                  ),
                  SizedBox(height: 10,),
                  ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children:  data.data.products.map((product) =>  Container(
                        margin: EdgeInsets.only(bottom: 14),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Container(
                                    color: Colors.grey,
                                    child: Image.network(
                                      BASE_URL_image+product.image,
                                      height: 50.0,
                                      width: 50.0,
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(product.name),
                                    Text(product.model_no),
                                  ],
                                ),
                                Text("Discount: "+product.max_discount+"Tk"),
                                Text(product.unit_price+"Tk",style: TextStyle(fontWeight: FontWeight.bold),),

                              ],
                            ),
                            const Divider(
                              thickness: 1, // thickness of the line
                              indent: 20, // empty space to the leading edge of divider.
                              endIndent: 20, // empty space to the trailing edge of the divider.
                              color: kPrimaryColorx, // The color to use when painting the line.
                              height: 20, // The divider's height extent.
                            ),
                          ],
                        )
                      )
                      ).toList()
                  ),
                  Container(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Before: "+data.data.order[0].total_before_discount),
                        Text("Discount: "+data.data.order[0].discount),
                        Text("After: "+data.data.order[0].total_after_discount),
                        Text("VAt: "+data.data.order[0].vat),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 24,top: 10),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Grand Total: "),
                        Text(data.data.order[0].grand_total,style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 24,top: 10,left: 20),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Store: ",style: TextStyle(fontWeight: FontWeight.w400)),
                        Text(data.data.store[0].name,style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(right: 24,top: 10,left: 20),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Sr Name: ",style: TextStyle(fontWeight: FontWeight.w400)),
                        Text(data.data.sr_name[0].first_name,style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 24,top: 10,left: 20),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Dp Name: ",style: TextStyle(fontWeight: FontWeight.w400)),
                        Text(data.data.dp_name[0].first_name,style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(height: 50,),
                  data.data.order[0].status=="pending"? circuler?Center(child:CircularProgressIndicator()): ShadowCarveButton(btnText: "Delivered",pressed: (){
                    setState(() {
                      circuler=true;
                    });
                    BlocProvider.of<OrderCubit>(context).updateOrderStatus(
                        widget.orderId, token);
                  },
                    width: MediaQuery.of(context).size.width*0.6,color: Colors.green,
                    height: 55,
                  ):Container(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
