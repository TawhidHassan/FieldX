import 'package:flutter/material.dart';

import 'box_custom.dart';

class NMButton extends StatelessWidget {
  final IconData icon;
  final double width;
  final double height;
  final double iconSize;
  final Color color;
  const NMButton({this.icon, this.width, this.height, this.iconSize, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: nMbox,
      child: Icon(
        icon,
        color:color,
        size: iconSize,
      ),
    );
  }
}