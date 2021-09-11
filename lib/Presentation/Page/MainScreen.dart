// ignore_for_file: file_names, unnecessary_new

import 'package:fieldx/Presentation/Page/Home/HomePage.dart';
import 'package:fieldx/Presentation/Page/Home/home_screen.dart';
import 'package:fieldx/Presentation/Page/Route/DpRoutes.dart';
import 'package:flutter/material.dart';
import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:hive/hive.dart';

import 'Map/DpOrderStoreMap.dart';
import 'Map/MapRoute.dart';
import 'Order/OrderCreate.dart';
import 'Order/Ordered/RouteSelectPage.dart';
import 'Order/RouteSelectPage.dart';
import 'Route/Routes.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  int currentPage;
  Color currentColor = Colors.deepPurple;
  Color inactiveColor = Colors.black;
  PageController tabBarController;
  List<Tabs> tabs = new List();
  var users;
  String role;
  void getData() async{
    users= await Hive.openBox('users');
    setState(() {
      role=users.get('role');
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    currentPage = 0;
    tabs.add(Tabs(
      Icons.home,
      "Home",
      Colors.deepPurple,
      getGradient(Colors.deepPurple),
    ));
    tabs.add(
        Tabs(Icons.alt_route, "Route", Colors.pink, getGradient(Colors.pink)));
    tabs.add(
        Tabs(Icons.map_outlined, "Map", Colors.amber, getGradient(Colors.amber)));
    tabs.add(Tabs(
        Icons.border_color, "Order", Colors.teal, getGradient(Colors.teal)));
    tabBarController = new PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          controller: tabBarController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            HomePage(),
            role=="SR"?Routes():DpRoutes(),
            role=="SR"?RouteMapPage():DpOrderMapPage(),
            role=="SR"?RouteSelect():DpRouteSelect(),

          ]),

      bottomNavigationBar: CubertoBottomBar(
        key: Key("BottomBar"),
        inactiveIconColor: inactiveColor,
        tabStyle: CubertoTabStyle.STYLE_FADED_BACKGROUND,
        selectedTab: currentPage,
        tabs: tabs
            .map((value) => TabData(
            key: Key(value.title),
            iconData: value.icon,
            title: value.title,
            tabColor: value.color,
            tabGradient: value.gradient))
            .toList(),
        onTabChangedListener: (position, title, color) {
          setState(() {
            currentPage = position;
            tabBarController.jumpToPage(position);
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    tabBarController.dispose();
    super.dispose();
  }
}

class Tabs {
  final IconData icon;
  final String title;
  final Color color;
  final Gradient gradient;

  Tabs(this.icon, this.title, this.color, this.gradient);
}

getGradient(Color color) {
  return LinearGradient(
      colors: [color.withOpacity(0.5), color.withOpacity(0.1)],
      stops: [0.0, 0.7]);
}
