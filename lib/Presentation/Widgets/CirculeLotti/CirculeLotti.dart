import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class CirculeLotti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20.0,
      child: ClipRRect(
        child: Lottie.asset('assets/lottie/route_lotti.json'),
        borderRadius: BorderRadius.circular(50.0),
      ),
    );
  }
}
