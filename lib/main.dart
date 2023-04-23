import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/screen.dart';
import 'package:flutter_application_1/theme_service.dart';
import 'package:get_storage/get_storage.dart';

import 'screens/article_screen.dart';
import 'screens/discover_screen.dart';
import 'screens/home_screen.dart';
import 'screens/setting_screen.dart';

void main(List<String> args) async{
  await GetStorage.init();

   runApp(myApp());
}

class myApp extends StatelessWidget{
  myApp({Key? key}) : super(key: key);
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      theme: themeService().lightTheme,
      darkTheme: themeService().darkTheme,
      themeMode: themeService().getThemeMode(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter News App',
      initialRoute: '/',
      routes: {
        homeScreen.routeName: (context) => homeScreen(),
        discoverScreen.routeName:(context) => discoverScreen(),
        articleScreen.routeName:(context) => articleScreen(),
        settingScreen.routeName:(context) => settingScreen()
      },
    );
  }
}
