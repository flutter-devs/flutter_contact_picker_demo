import 'dart:async';
import 'package:flutter_contact_picker/Constant/Constant.dart';
import 'package:flutter_contact_picker/Screens/SplashScreen.dart';
import 'package:flutter_contact_picker/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';


main() {

  runApp(new MaterialApp(
    title: 'Flutter Contact Picker',
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
        accentColor: Colors.black
        ,
        primaryColor: Colors.black,
        primaryColorDark: Colors.black

    ),
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      HOME_SCREEN: (BuildContext context) => new HomeScreen(),
      ANIMATED_SPLASH: (BuildContext context) => new SplashScreen()
    },
  ));
}


