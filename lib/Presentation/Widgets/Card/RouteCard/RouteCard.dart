import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RouteCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final  _random = Random();
    Color color=Colors.primaries[_random.nextInt(Colors.primaries.length)]
    [_random.nextInt(9) * 100];
    return Padding(
      padding: EdgeInsets.all(13),
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child:  Lottie.asset('assets/lottie/route_lotti.json'),
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
                      Text("Name xxxxxxx",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 22),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Gulsanllll",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 16),),
                          Text("Dhakappppp",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 16),),
                          Text("Keraniganjxxx",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 16),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Sr: Jubair",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 16),),
                          SizedBox(width: 4,),
                          Text("Dp: skjsks",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 16),),
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
