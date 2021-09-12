// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fieldx/Constants/Colors/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  bool isDrawerOpen = false;
  String role;

  void getData() async{
    var users= await Hive.openBox('users');
    // print("hive "+users.get('token'));
    setState(() {
      role=users.get('role');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(isDrawerOpen ? 0.85 : 1.00)
        ..rotateZ(isDrawerOpen ? -50 : 0),
      duration: Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        isDrawerOpen ? BorderRadius.circular(40) : BorderRadius.circular(0),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: kPrimaryColorx,
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  isDrawerOpen
                      ? GestureDetector(
                    child: Icon(Icons.arrow_back_ios,color: Colors.white,),
                    onTap: () {
                      setState(() {
                        xOffset = 0;
                        yOffset = 0;
                        isDrawerOpen = false;
                      });
                    },
                  )
                      : GestureDetector(
                    child: Icon(Icons.menu,color: Colors.white,),
                    onTap: () {
                      setState(() {
                        xOffset = 330;
                        yOffset = 80;
                        isDrawerOpen = true;
                      });
                    },
                  ),
                  const Text(
                    'Home Page',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  ),
                  Container(),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.9,
              child: Column(
                children:[

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

