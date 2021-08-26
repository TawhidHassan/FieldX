import 'package:flutter/material.dart';

import 'box_custom.dart';



class AvatarImage extends StatelessWidget {
  final double width;
  final double height;
  final String image;

  const AvatarImage({Key key, this.width, this.height, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(8),
      decoration: nMbox,
      child: Container(
        decoration: nMbox,
        padding: EdgeInsets.all(3),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("assets/images/main_top.png"),
            ),
          ),
        ),
      ),
    );
  }
}
