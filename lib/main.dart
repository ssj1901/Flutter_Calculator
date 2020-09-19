import 'package:flutter/material.dart';
import 'package:calculator/pages/splash_screen.dart';
import 'package:calculator/pages/calculator.dart';

var routes = <String, WidgetBuilder>{
   "/home": (BuildContext context) => Home(),
};

void main() => runApp(new MaterialApp(
    theme:
        ThemeData(primaryColor: Colors.red, ),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: routes));