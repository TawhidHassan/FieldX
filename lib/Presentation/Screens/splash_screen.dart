// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:fieldx/Presentation/Animation/fade_in_animation.dart';
import 'package:fieldx/Presentation/Page/Home/HomePage.dart';
import 'package:fieldx/Presentation/Page/Login/LoginPage.dart';
import 'package:fieldx/Presentation/Page/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  AnimationController _scaleController;
  AnimationController _scale2Controller;
  AnimationController _widthController;
  AnimationController _positionController;

  Animation<double> _scaleAnimation;
  Animation<double> _scale2Animation;
  Animation<double> _widthAnimation;
  Animation<double> _positionAnimation;
//storage instance
  SharedPreferences pref;
  String token;
  bool hideIcon = false;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, myPage);
  }

  void myPage() {
    _scaleController.forward();
  }

  @override
  void initState(){
    // TODO: implement initState
    super.initState();

    SharedPreferences.getInstance().then((prefValue) => {
      setState(() {
        token =  prefValue.getString("token");
      })
    });
    startTime();
    _scaleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _scaleAnimation =
    Tween<double>(begin: 1.0, end: 0.8).animate(_scaleController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _widthController.forward();
        }
      });

    _widthController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));

    _widthAnimation =
    Tween<double>(begin: 80.0, end: 300.0).animate(_widthController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _positionController.forward();
        }
      });

    _positionController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    _positionAnimation =
    Tween<double>(begin: 0.0, end: 215.0).animate(_positionController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            hideIcon = true;
          });
          _scale2Controller.forward();
        }
      });

    _scale2Controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _scale2Animation =
    Tween<double>(begin: 1.0, end: 32.0).animate(_scale2Controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          getSessionValues();
        }
      });
  }

  getSessionValues() async {
    token!=null?Navigator.pushReplacement(context, PageTransition(MainScreen())) :Navigator.pushReplacement(context, PageTransition(LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery
        .of(context)
        .size
        .width;
    final double height = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Container(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: FadeAnimation(
                      1.6,
                      Container(
                        width: width / 2.3,
                        height: height / 4.8,
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            image: DecorationImage(
                                image: AssetImage('assets/images/user.png'),
                                fit: BoxFit.cover)),
                      )),
                )),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
//                  SizedBox(height: height / 30,),
                  FadeAnimation(
                      1,
                      Text(
                        "Welcome To FieldX",
                        style: GoogleFonts.vollkorn(
                            color: Colors.white, fontSize: 45),
                      )),
                  SizedBox(
                    height: height / 400,
                  ),
                  FadeAnimation(
                      1.3,
                      Text(
                        "We Make Your Work Easy..!!",
                        style: GoogleFonts.vollkorn(
                            color: Colors.white,
                            height: 1.4,
                            fontSize: 24),
                      )),
//                  FadeAnimation(1.5, Text("Application..!!",
//                    style: GoogleFonts.vollkorn(color: Colors.black.withOpacity(.7), height: 1.4, fontSize: 24),)),
                  SizedBox(
                    height: height / 20,
                  ),
                  FadeAnimation(
                      1.6,
                      AnimatedBuilder(
                        animation: _scaleController,
                        builder: (context, child) =>
                            Transform.scale(
                                scale: _scaleAnimation.value,
                                child: Center(
                                  child: AnimatedBuilder(
                                    animation: _widthController,
                                    builder: (context, child) =>
                                        Container(
                                          width: _widthAnimation.value,
                                          height: 80,
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius
                                                  .circular(50),
                                              color: Colors.blue.withOpacity(
                                                  .4)),
                                          child: InkWell(
                                            onTap: () {
                                              _scaleController.forward();
                                            },
                                            child: Stack(children: <Widget>[
                                              AnimatedBuilder(
                                                animation: _positionController,
                                                builder: (context, child) =>
                                                    Positioned(
                                                      left: _positionAnimation
                                                          .value,
                                                      child: AnimatedBuilder(
                                                        animation: _scale2Controller,
                                                        builder: (context,
                                                            child) =>
                                                            Transform.scale(
                                                                scale:
                                                                _scale2Animation
                                                                    .value,
                                                                child: Container(
                                                                  width: 60,
                                                                  height: 60,
                                                                  decoration: BoxDecoration(
                                                                      shape:
                                                                      BoxShape
                                                                          .circle,
                                                                      color: Colors
                                                                          .redAccent),
                                                                  child: hideIcon ==
                                                                      false
                                                                      ? Icon(
                                                                    Icons
                                                                        .arrow_forward,
                                                                    color:
                                                                    Colors
                                                                        .white,
                                                                  )
                                                                      : Container(),
                                                                )),
                                                      ),
                                                    ),
                                              ),
                                            ]),
                                          ),
                                        ),
                                  ),
                                )),
                      )),
                  SizedBox(
                    height: height / 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition(this.page)
      : super(
    pageBuilder: (context, animation, anotherAnimation) => page,
    transitionDuration: Duration(milliseconds: 2000),
    transitionsBuilder: (context, animation, anotherAnimation, child) {
      animation = CurvedAnimation(
        curve: Curves.fastOutSlowIn,
        parent: animation,
      );
      return Align(
        alignment: Alignment.bottomCenter,
        child: SizeTransition(
          sizeFactor: animation,
          child: page,
          axisAlignment: 0,
        ),
      );
    },
  );
}