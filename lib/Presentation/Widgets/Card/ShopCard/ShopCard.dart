import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ShopCard extends StatelessWidget {
  final String name;
  final String code;
  final String ownerName;

  const ShopCard({Key key, this.name, this.code, this.ownerName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final  _random = Random();
    Color color=Colors.primaries[_random.nextInt(Colors.primaries.length)]
    [_random.nextInt(9) * 100];
    return Padding(
      padding: EdgeInsets.all(12),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: color,
                spreadRadius: 3,
                blurRadius: 10,
                offset: Offset(2, 1), // changes position of shadow
              ),
            ],
            color: color,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: color,
                width: 0.4
            ),
          ),
          width: MediaQuery.of(context).size.width*0.9,
          height: MediaQuery.of(context).size.height*0.1,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: CircleAvatar(
                  radius: 30.0,
                  child: ClipRRect(
                    child: Lottie.asset('assets/lottie/shop_lotti.json',),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 22),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Store code:"+code,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 16),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Owner Name:"+ownerName,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 16),),
                        ],
                      ),


                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
