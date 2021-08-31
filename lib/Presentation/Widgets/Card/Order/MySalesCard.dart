import 'dart:math';

import 'package:flutter/material.dart';


class MySalescard extends StatefulWidget {

  final String customername;
  final String remark;
  final String employ;
  final String productName;
  final String quantity;
  final String date;
  final String colorx;
  final String customerEmail;
  final String customerMobile;
  final String storeName;
  final String price;


  MySalescard(
      {this.customername,
      this.remark,
      this.employ,
      this.productName,
      this.quantity,
      this.date,
      this.colorx,
      this.customerEmail,
      this.customerMobile,
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
    int totla=int.parse(widget.price)*int.parse(widget.quantity);
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
                          Text(widget.customername,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
                          Text("Contact: ${widget.customerMobile},o",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black),),
                          Text("date: "+widget.date.substring(0, 10),style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black),),
                          Text("${widget.productName}| ${widget.colorx} | ${widget.quantity}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
                          Text("Sold By: ${widget.employ}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.blue),),
                          Text("Store: ${widget.storeName}",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black),),
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
                          Text("${widget.quantity} x",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800,color: Colors.white),),
                          Text(totla.toString()+" Tk",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800,color: Colors.white),),
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
