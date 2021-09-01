import 'dart:math';

import 'package:fieldx/Presentation/Widgets/CirculeLotti/CirculeLotti.dart';
import 'package:flutter/material.dart';

class MapRouteBottomCard extends StatelessWidget {
  final String name;

  final  _random = Random();
  Color color=Colors.primaries[Random().nextInt(Colors.primaries.length)]
  [Random().nextInt(9) * 100];

   MapRouteBottomCard({Key key, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      width: MediaQuery.of(context).size.width*0.4,
      height: MediaQuery.of(context).size.height*0.1,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CirculeLotti(),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800),),
              ],
            ),
          ),
        ],
      ),

    );
  }
}
