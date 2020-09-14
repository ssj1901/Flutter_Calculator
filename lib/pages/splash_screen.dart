import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () => MyNavigator.goToHome(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(gradient: LinearGradient(colors: [Color.fromRGBO(156,236,251,1),Color.fromRGBO(101,199,247,1),Color.fromRGBO(0,82,212,1)]))
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    SvgPicture.asset("assets/calculator2.svg",height:150,width:150),                      
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      // Text(
                      //   Flutkart.name,
                      //   style: TextStyle(
                      //       color: Colors.white,
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 24.0),
                      // )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  SpinKitWave(
                       color: Colors.white,
                       size: 50.0,
                        ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    // Text(
                    //   Flutkart.store,
                    //   softWrap: true,
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 18.0,
                    //       color: Colors.white),
                    // )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class MyNavigator {
  static void goToHome(BuildContext context) {
    Navigator.pushNamed(context, "/home");
  }

}