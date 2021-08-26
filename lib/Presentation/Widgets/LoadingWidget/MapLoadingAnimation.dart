import 'dart:async';
import 'package:flutter/material.dart';

class MapLoadingAnimation extends StatefulWidget {
  @override
  _MapLoadingAnimationState createState() => _MapLoadingAnimationState();
}

class _MapLoadingAnimationState extends State<MapLoadingAnimation>
    with TickerProviderStateMixin {

  AnimationController controller1;
  AnimationController controller2;

  Animation<double> rippleRadius;
  Animation<double> rippleOpacity;
  Animation<double> centerCircleRadius;



  @override
  void initState() {
    super.initState();
    controller1 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2500));
    rippleRadius = Tween<double>(begin: 0, end: 150)
        .animate(CurvedAnimation(parent: controller1, curve: Curves.ease))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller1.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller1.forward();
        }
      });

    rippleOpacity = Tween<double>(begin: 1, end: 0)
        .animate(CurvedAnimation(parent: controller1, curve: Curves.ease))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller1.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller1.forward();
        }
      });

    controller2 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1250));
    centerCircleRadius = Tween<double>(begin: 22, end: 16).animate(
        CurvedAnimation(
            parent: controller2,
            curve: Curves.ease,
            reverseCurve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2.forward();
        }
      });

    Timer(Duration(milliseconds: 1600), () {
      controller1.forward();
    });
    controller2.forward();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Container(
          height: _width,
          width: _width,
          child: CustomPaint(
            painter: MyPainter(rippleRadius.value, rippleOpacity.value,
                centerCircleRadius.value),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double radius;
  final double opacity;
  final double centerCircleRadius;

  MyPainter(this.radius, this.opacity, this.centerCircleRadius);

  @override
  void paint(Canvas canvas, Size size) {
    var paint_1 = Paint();
    paint_1..color = Colors.blue.withOpacity(opacity);
    paint_1..style = PaintingStyle.fill;

    canvas.drawCircle(
        Offset(size.width * .5, size.height * .5), radius, paint_1);

    var paint_2 = Paint();
    paint_2..color = Colors.white;
    paint_2..style = PaintingStyle.fill;

    canvas.drawCircle(
        Offset(size.width * .5, size.height * .5), size.width / 11, paint_2);

    var paint_3 = Paint();
    paint_3..color = Colors.blue;
    paint_3..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(size.width * .5, size.height * .5),
        size.width / centerCircleRadius, paint_3);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}