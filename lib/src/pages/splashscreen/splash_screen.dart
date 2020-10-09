import 'dart:async';
import 'package:farmasee/src/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';


class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: new LoginPage(),
      title: new Text('Pharmasee',textScaleFactor: 2,),
      image: new Image.asset('assets/images/logo.png'),
      loadingText: Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.blue,
    );
  }
}