// ignore_for_file: file_names

import 'package:fieldx/Presentation/Widgets/Menu/drawer_screen.dart';
import 'package:fieldx/Presentation/Page/Home/home_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          HomeScreen()
        ],
      ),
    );
  }
}
