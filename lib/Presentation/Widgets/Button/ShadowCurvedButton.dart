import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';

class ShadowCarveButton extends StatelessWidget {
  final Function pressed;
  final double width;
  final double height;
  final String btnText;
  final Color color;

  const ShadowCarveButton({Key key, this.pressed, this.width, this.btnText, this.color, this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(

        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(40),
              shadowColor:color?? Colors.blue,
              child: AnimatedButton(
                width: width??300,
                height:height??50,
                enabled: true,
                shadowDegree: ShadowDegree.dark,
                color:color?? Theme.of(context).primaryColor,
                onPressed: pressed,
                child: Center(child:Text(btnText??"Submit",style: TextStyle(color: Colors.white,fontSize: 20),)),
              ),
            ),
          ),
        )
    );
  }
}
