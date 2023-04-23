import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/discover_screen.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/screen.dart';
import 'package:flutter_application_1/screens/setting_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black.withAlpha(100),
      items: [
        BottomNavigationBarItem(icon: Container(
          margin: EdgeInsets.only(left: 50),
          child: IconButton(onPressed: (){
            Navigator.pushNamed(context, homeScreen.routeName);
          }, icon: Icon(Icons.home)),
        )
        , label: 'home',),
        BottomNavigationBarItem(icon: IconButton(onPressed: (){
           Navigator.pushNamed(context, discoverScreen.routeName);
        }, icon: Icon(Icons.search))
        , label: 'Search',),

         BottomNavigationBarItem(icon: Container(
          margin: EdgeInsets.only(left: 50),
          child: IconButton(onPressed: (){
            Navigator.pushNamed(context, settingScreen.routeName);
          }, icon: Icon(Icons.settings)),
        )
        , label: 'settings',),
      ],
    );
  }
}