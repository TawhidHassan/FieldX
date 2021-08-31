import 'package:fieldx/Bloc/Order/order_cubit.dart';
import 'package:fieldx/Presentation/Widgets/Card/Order/MySalesCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
class SalesMonthWise extends StatefulWidget {
  @override
  _SalesMonthWiseState createState() => _SalesMonthWiseState();
}

class _SalesMonthWiseState extends State<SalesMonthWise> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  String leaveDate;
  String month;
  String userId;
  String token;
  DateTime selectedDate;
  DateTime initialDate=DateTime.now();


  void getData() async{
    var users= await Hive.openBox('users');
    // print("hive "+users.get('userId').toString());
    if (users.get('token') != null) {
      setState(() {
        token=users.get('token');
        BlocProvider.of<OrderCubit>(context).getOrder();
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    var date = new DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    if(dateParse.month.toString().length<2){
      month="0"+dateParse.month.toString();
    }else{
      // selectedDate.month.toString().length<2 ? "0"+selectedDate.month.toString():selectedDate.month.toString()
      month=dateParse.month.toString();
    }

    var formattedDate = "$month-${dateParse.year}";
    leaveDate=formattedDate.toString();
    getData();

    print(leaveDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:  BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if(!(state is OrderGet)){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final sales= (state as OrderGet).saleResponsex;
          Logger().d(sales.sales);
          return
            Material(
              elevation: 30.0,
              shadowColor: Colors.blueAccent,
              color: Colors.blue,
              child: Container(
                padding: EdgeInsets.only(left: 0,right:0,top: 0),
                child: Column(
                  children: [
                    //AppBar//App bar
                    //App Bar
                    SizedBox(height:3,),
                    Flexible(
                      flex:100,
                      child: Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child:SingleChildScrollView(
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      showdialog();
                                    },
                                    child: Material(
                                        color: Color(0xffeeeeee),
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                                        child: Container(
                                          width: MediaQuery.of(context).size.width,
                                          height:50,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(leaveDate,style: TextStyle(fontSize: 19,fontWeight: FontWeight.w700,color:  Colors.grey[700]),),
                                              Icon(FontAwesomeIcons.calendarAlt,color: Colors.grey[700],)
                                            ],
                                          ),
                                        )
                                    ),
                                  ),
                                  sales.sales.isEmpty?Center(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                            height: 300,
                                            width: 300,
                                            child: Lottie.asset('assets/lottie/empty.json')
                                        ),
                                        Text(("No data found")),
                                      ],
                                    ),
                                  ):

                                  SizedBox(
                                    height: MediaQuery.of(context).size.height*0.9,
                                    child: ListView(
                                      physics:
                                      BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                      children:sales.sales.map((sale) =>
                                          Container(
                                              margin: EdgeInsets.only(bottom: 14),
                                              child:
                                              MySalescard(
                                                customername: sale.customername,
                                                price: sale.price,
                                                remark: sale.remark,
                                                colorx: sale.color,
                                                quantity: sale.quatity.toString(),
                                                customerEmail: sale.customeremail,
                                                customerMobile: sale.customermobile,
                                                date: sale.createdAt,
                                                employ: sale.username,
                                                productName: sale.productName,
                                                storeName: sale.storename,)
                                          )
                                      ).toList(),
                                    ),
                                  )

                                ],
                              )
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
        },
      ),
    );
  }
  void showdialog() {
    showMonthPicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 1, 5),
      lastDate: DateTime(DateTime.now().year + 1, 9),
      initialDate: selectedDate ?? initialDate,
    ).then((date) {
      if (date != null) {
        setState(() {
          selectedDate = date;
          if(selectedDate.month.toString().length<2){
            month="0"+selectedDate.month.toString();
          }else{
            // selectedDate.month.toString().length<2 ? "0"+selectedDate.month.toString():selectedDate.month.toString()
            month=selectedDate.month.toString();
          }

          leaveDate=month+"-"+selectedDate.year.toString();
          // BlocProvider.of<SalesCubit>(context).getUserSaleByMonth(userId,leaveDate);
        });
      }
    });
  }


}
