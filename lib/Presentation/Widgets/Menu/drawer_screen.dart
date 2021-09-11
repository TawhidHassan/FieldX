// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:fieldx/Constants/Strings/appStrings.dart';
import 'package:fieldx/Presentation/Page/Home/HomePage.dart';
import 'package:fieldx/Presentation/Screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';


class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  String name;
  String lastName;
  String email;
  String role;
  var users;
  @override
   initState()  {
    // TODO: implement initState
    super.initState();
    getData();
    
  }

  void getData() async{
    users= await Hive.openBox('users');
    print("hive "+users.get('userId').toString());
    setState(() {
      name=users.get('name');
      lastName=users.get('lastName');
      role=users.get('role');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Padding(
        padding: EdgeInsets.only(top: 50, left: 40, bottom: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/user.png'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    Text(
                      name??"",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 2,),
                    Text(
                      lastName??"",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )

              ],
            ),
            Column(
              children: <Widget>[

                NewRow(
                  text: 'Profile',
                  icon: Icons.person_outline,
                ),
                role=="SR"?SizedBox(
                  height: 20,
                ):Container(),
                role=="SR"? InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, PRODUCT_LIST_PAGE);
                  },
                  child: NewRow(
                    text: 'Products',
                    icon: Icons.pages_rounded,
                  ),
                ):Container(),

                role=="SR"?SizedBox(
                  height: 20,
                ):Container(),
                role=="SR"? InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, ORDER_SHOW_PAGE);
                  },
                  child: NewRow(
                    text: 'Orders',
                    icon: Icons.lightbulb_outline,
                  ),
                ):Container(),
                role=="DP"?SizedBox(
                  height: 20,
                ):Container(),
                role=="DP"? InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, ORDER_PENDING_PAGE);
                  },
                  child: NewRow(
                    text: 'Pending Orders',
                    icon: Icons.lightbulb_outline,
                  ),
                ):Container(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.cancel,
                  color: Colors.white.withOpacity(0.5),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () async {
                    var users= await Hive.openBox('users');
                    users.clear();
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  },
                  child: Text(
                    'Log out',
                    style: TextStyle(color: Colors.white.withOpacity(0.5)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }




}

class NewRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const NewRow({
    Key key,
     this.icon,
     this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.white,
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
