import 'package:fieldx/Presentation/Widgets/Card/RouteCard/RouteCard.dart';
import 'package:fieldx/Presentation/Widgets/Card/ShopCard/ShopCard.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Shops extends StatefulWidget {
  final int shopId;

  const Shops({Key key, this.shopId}) : super(key: key);
  @override
  _ShopsState createState() => _ShopsState();
}

class _ShopsState extends State<Shops> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shops"),),
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
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child:  Column(
                          children: [
                             Column(
                              children: [
                                SizedBox(
                                    height: 300,
                                    width: 300,
                                    child: Lottie.asset('assets/lottie/empty.json')
                                ),
                                Text(("No data found")),
                              ],
                            ),

                            ShopCard(),
                          ],
                        )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
