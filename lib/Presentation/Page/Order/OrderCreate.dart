import 'package:fieldx/Bloc/Order/order_cubit.dart';
import 'package:fieldx/Bloc/Product/product_cubit.dart';
import 'dart:io';
import 'package:fieldx/Bloc/User/user_cubit.dart';
import 'package:fieldx/Constants/Strings/appStrings.dart';
import 'package:fieldx/Data/DummyModel/ProductItem.dart';
import 'package:fieldx/Data/Model/Product/Product.dart';
import 'package:fieldx/Data/Model/User/Dp.dart';
import 'package:fieldx/Presentation/Screens/splash_screen.dart';
import 'package:fieldx/Presentation/Widgets/Button/ShadowCurvedButton.dart';
import 'package:fieldx/Presentation/Widgets/Card/Producard/ProductCard.dart';
import 'package:fieldx/Presentation/Widgets/Card/RouteCard/RouteCard.dart';
import 'package:fieldx/Presentation/Widgets/Card/ShopCard/ShopCard.dart';
import 'package:fieldx/Presentation/Widgets/TextField/materialTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../MainScreen.dart';

class OrderCreate extends StatefulWidget {
  final int shopId;
  final int routeId;
  const OrderCreate({Key key, this.shopId, this.routeId}) : super(key: key);
  @override
  _OrderCreateState createState() => _OrderCreateState();
}

class _OrderCreateState extends State<OrderCreate> {

  String token;
  String name;
  String deliveryDate;
  Product selectedValue;
  Dp selectedDp;
  TextEditingController quatity=new TextEditingController();
  TextEditingController price=new TextEditingController();
  TextEditingController discount=new TextEditingController();
  TextEditingController vat=new TextEditingController();
  List<ProductEx> itemX=List<ProductEx>();
  int beforeDiscount=0;
  int afterDiscount=0;
  int grandTota=0;
  bool circuler=false;

  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('MM-yyyy');
  static final DateFormat formate = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(now);
  final String dateIn=formate.format(now);
  int userId;
  void getData() async{
    var users= await Hive.openBox('users');
    // print("hive "+users.get('userId').toString());
    if (users.get('token') != null) {
      setState(() {
        token=users.get('token');
        name=users.get('name');
        userId=users.get('userId');
        BlocProvider.of<ProductCubit>(context).loadproduct(token);
        BlocProvider.of<UserCubit>(context).loadDpUsers(token,widget.routeId);
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
      appBar: AppBar(title: Text("Order Create"),),
      body: BlocListener<OrderCubit, OrderState>(
        listener: (context, state) {
          if(state is OerderSave){
            setState(() {
              circuler=false;
            });
            Navigator.pushReplacement(context, PageTransition(MainScreen()));
          }
        },
        child: Material(
          elevation: 30.0,
          shadowColor: Colors.grey,
          color: Colors.white,
          child: Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.only(left: 0,right:0,top: 0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                children: [
                  SizedBox(height:3,),
                  Column(
                    children: [
                      Text("Select Dp"),
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.grey, //                   <--- border color
                            width: 1.0,
                          ),
                        ) ,
                        child: BlocBuilder<UserCubit, UserState>(
                          builder: (context, state) {
                            if(!(state is DpUserGet)){
                              return Center(child: CircularProgressIndicator(),);
                            }
                            final data=(state as DpUserGet).dpResponse;
                            return SearchableDropdown(
                              items: data.data.map((item) {
                                return new DropdownMenuItem<Dp>(
                                    child: Text(item.dp_first_name), value: item);
                              }).toList(),
                              isExpanded: true,
                              value: selectedDp,
                              isCaseSensitiveSearch: true,
                              searchHint:  Text(
                                'Select DP ',
                                style:TextStyle(fontSize: 20),
                              ),
                              hint: "Select DP",
                              onChanged: (value) {
                                setState(() {
                                  selectedDp = value;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height:10,),
                  InkWell(
                    onTap: (){
                      showdialog();
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey, //                   <--- border color
                          width: 1.0,
                        ),
                      ) ,
                      child: Text(deliveryDate??"Select Delivery date"),
                    ),
                  ),
                  SizedBox(height:10,),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.grey, //                   <--- border color
                              width: 1.0,
                            ),
                          ) ,
                          child: BlocBuilder<ProductCubit, ProductState>(
                            builder: (context, state) {
                              if(!(state is GetProduct)){
                                return Center(child: CircularProgressIndicator(),);
                              }
                              final data=(state as GetProduct).productResponse;
                              return SearchableDropdown(
                                items: data.data.map((item) {
                                  return new DropdownMenuItem<Product>(
                                      child: Text(item.name), value: item);
                                }).toList(),
                                isExpanded: true,
                                value: selectedValue,
                                isCaseSensitiveSearch: true,
                                searchHint:  Text(
                                  'Select ',
                                  style:TextStyle(fontSize: 20),
                                ),
                                hint: "Select Product",
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value;
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(width:4,),
                      Expanded(
                        flex: 3,
                        child: MaterialTextField(lable: "Price",controller: price,hintText: "Price",),
                      ),
                      SizedBox(width:4,),
                      Expanded(
                        flex: 2,
                        child: MaterialTextField(lable: "Qty",controller: quatity,hintText: "Qty",),
                      ),
                    ],
                  ),
                  ShadowCarveButton(btnText: "Add",pressed: (){
                    setState(() {
                      itemX.add(ProductEx(item: selectedValue.name, quatity: int.parse(quatity.text), price: int.parse(price.text),total: int.parse(quatity.text)*int.parse(price.text),id:selectedValue.id ));
                      beforeDiscount+=int.parse(quatity.text)*int.parse(price.text);
                      afterDiscount=0;
                      discount.text="";
                      grandTota=beforeDiscount;
                    });
                  },
                    width: MediaQuery.of(context).size.width*0.4,color: Colors.green,
                    height: 45,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    // itemCount: itemX.length,
                    itemCount: itemX.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(itemX[index].item),
                                ],
                              ),
                              Text(itemX[index].price.toString()+"x"+itemX[index].quatity.toString()),
                              Text(itemX[index].total.toString()),
                              InkWell(
                                  onTap: (){
                                    setState(() {
                                      beforeDiscount-=itemX[index].price*itemX[index].quatity;
                                      grandTota=beforeDiscount;
                                      itemX.removeAt(index);

                                    });
                                  },
                                  child: Icon(Icons.delete,color: Colors.redAccent,)
                              )
                            ],
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                            color: Colors.grey,
                          ),
                        ],
                      ) ;
                    },
                  ),
                  SizedBox(height:10,),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey, //                   <--- border color
                        width: 1.0,
                      ),
                    ) ,
                    child: Text("Total Before Discount: "+beforeDiscount.toString()),
                  ),
                  SizedBox(height:10,),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please fillup';
                      }
                      return null;
                    },
                    controller: discount,
                    onChanged: (text) {
                      setState(() {
                        afterDiscount=beforeDiscount-int.parse(text);
                        grandTota=afterDiscount;

                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Discount",
                      labelText: "Discount",
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  ),
                  SizedBox(height:10,),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey, //                   <--- border color
                        width: 1.0,
                      ),
                    ) ,
                    child: Text("Total After Discount: "+afterDiscount.toString()),
                  ),
                  SizedBox(height:10,),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please fillup';
                      }
                      return null;
                    },
                    controller: vat,
                    onChanged: (text) {
                      setState(() {
                        grandTota=afterDiscount-int.parse(text);
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Vat",
                      labelText: "Vat",
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  ),
                  SizedBox(height:10,),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey, //                   <--- border color
                        width: 1.0,
                      ),
                    ) ,
                    child: Text("Grand Total: "+grandTota.toString()),
                  ),
                  circuler?Center(child:CircularProgressIndicator()): ShadowCarveButton(btnText: "Submit",pressed: (){
                    setState(() {
                      circuler=true;
                    });
                    BlocProvider.of<OrderCubit>(context).saveOrder(
                        token,widget.routeId,widget.shopId,name,selectedDp.dp_first_name,
                        dateIn,deliveryDate.substring(0,10),itemX,beforeDiscount,int.parse(discount.text),
                        afterDiscount,int.parse(vat.text),grandTota,userId,int.parse(selectedDp.dp_id)
                    );
                  },
                    width: MediaQuery.of(context).size.width*0.6,color: Colors.green,
                    height: 55,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }





  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is DateTime) {
      final DateTime selectedDate = args.value;
      setState(() {
        deliveryDate=selectedDate.toString();
      });
      print(deliveryDate.substring(0,10));
    } else {
      final List<PickerDateRange> selectedRanges = args.value;
    }
  }


  void showdialog() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
            title: Text('Dialog Title'),
            content: Container(
              height: 300,
              width: 400,
              child: SfDateRangePicker(
                view: DateRangePickerView.month,
                monthViewSettings: DateRangePickerMonthViewSettings(firstDayOfWeek: 6),
                showNavigationArrow: true,
                selectionShape: DateRangePickerSelectionShape.rectangle,
                toggleDaySelection: true,
                // selectionMode: DateRangePickerSelectionMode.range,
                selectionMode: DateRangePickerSelectionMode.single,
                onSelectionChanged: _onSelectionChanged,

              ),
            )
        )
    );
  }

}
