import 'package:fieldx/Bloc/Route/route_cubit.dart';
import 'package:fieldx/Constants/Strings/appStrings.dart';
import 'package:fieldx/Presentation/Widgets/Card/RouteCard/RouteCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';

class Routes extends StatefulWidget {
  @override
  _RoutesState createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {


  int userId;
  String token;
  void getData() async{
    var users= await Hive.openBox('users');
    print("hive "+users.get('userId').toString());
    if (users.get('token') != null) {
      setState(() {
        userId=users.get('userId');
        token=users.get('token');
        BlocProvider.of<RouteCubit>(context).loadRouteForUser(userId,token);
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

    return Scaffold(
      appBar: AppBar(title: Text("Routes"),),
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
                child: BlocBuilder<RouteCubit, RouteState>(
                  builder: (context, state) {
                    if(!(state is GetRoute)){
                      return Center(child: CircularProgressIndicator(),);
                    }
                    final data=(state as GetRoute).routeResponse;
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
                                            Navigator.pushNamed(context, SHOP_PAGE, arguments: {
                                              'shopId':data.id
                                            });
                                          },
                                          child: RouteCard(name: data.name,area: data.area.name,dp: data.dp.first_name,region: data.region.name,sr: data.sr.first_name,terotori: data.territory.name,)),
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
