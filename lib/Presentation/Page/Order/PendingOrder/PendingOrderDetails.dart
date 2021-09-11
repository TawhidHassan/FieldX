import 'package:fieldx/Bloc/Order/order_cubit.dart';
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
                children: [
                  ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics:
                      BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      children:  data.data.products.map((product) =>  Container(
                        margin: EdgeInsets.only(bottom: 14),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                BASE_URL_image+product.image,
                                height: 50.0,
                                width: 50.0,
                              ),
                            ),
                            Text(product.name+"("+product.model_no+")"),
                            SizedBox(width: 4,),
                            Text(product.unit_price+"Tk"),
                          ],
                        ),
                      )
                      ).toList()
                  ),
                  Text("Status: "+data.data.order[0].status),
                  Text("Before Discount: "+data.data.order[0].total_before_discount),
                  Text("Discount: "+data.data.order[0].discount),
                  Text("After Discount: "+data.data.order[0].total_after_discount),
                  Text("VAt: "+data.data.order[0].vat),
                  Text("Grand Total: "+data.data.order[0].grand_total),
                  Text("Store: "+data.data.store[0].name),
                  Text("Sr: "+data.data.sr_name[0].first_name),
                  Text("Dp: "+data.data.dp_name[0].first_name),

                  data.data.order[0].status=="delivered"? circuler?Center(child:CircularProgressIndicator()): ShadowCarveButton(btnText: "Delivered",pressed: (){
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
