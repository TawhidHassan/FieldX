import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'box_custom.dart';

class SocialBox extends StatelessWidget {
  final IconData icon;
  final String count;
  final String category;
  final double padding;

  const SocialBox({this.icon, this.count, this.category, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(padding),
        decoration: nMboxInvert,
        child: Row(
          children: <Widget>[
            FaIcon(icon, color: Colors.blue[300], size: 20),
            SizedBox(width: 8),
            Text(
              count,
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            SizedBox(width: 3),
            Text(
              category,
            ),
          ],
        ),
      );
  }
}