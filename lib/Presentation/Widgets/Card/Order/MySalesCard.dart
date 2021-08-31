import 'dart:math';

import 'package:flutter/material.dart';


class MySalescard extends StatefulWidget {

  final String customername;
  final String remark;
  final String employ;
  final String productName;
  final String quantity;
  final String date;
  final String deliveryDate;
  final String customerEmail;
  final String dp;
  final String storeName;
  final String price;


  MySalescard(
      {this.customername,
      this.remark,
      this.employ,
      this.productName,
      this.quantity,
      this.date,
      this.deliveryDate,
      this.customerEmail,
      this.dp,
      this.storeName,
      this.price});

  @override
  State<MySalescard> createState() => _MySalescardState();
}

class _MySalescardState extends State<MySalescard> {
  @override
  Widget build(BuildContext context) {
    final  _random = Random();
    Color color=Colors.primaries[_random.nextInt(Colors.primaries.length)]
    [_random.nextInt(9) * 100];
    return
      Padding(
        padding: EdgeInsets.all(12),
        child:Material(
          shadowColor: color,
          elevation: 8,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: Colors.primaries[_random.nextInt(Colors.primaries.length)],
                  width: 0.4
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("DP: ${widget.dp}",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black),),
                          Text("date: "+widget.date.substring(0, 10),style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black),),
                          Text("Delivery Date:"+widget.deliveryDate.substring(0,10),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
                          Text("Sold By: ${widget.customername}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.blue),),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      height: MediaQuery.of(context).size.height * 0.15,
                      decoration: BoxDecoration(
                        color: Colors.primaries[_random.nextInt(Colors.primaries.length)],
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${widget.price} Tk",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800,color: Colors.white),),
                        ],
                        // for Network image
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ) ,
      );

  }
}
