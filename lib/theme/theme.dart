import 'package:flutter/material.dart';

import 'dinamic_colors.dart';

final XplainColors colors = XplainColors();

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  
  buttonColor: colors.btnColor(),

  buttonTheme: ButtonThemeData(
    buttonColor: colors.btnColor(),
  ),

   fontFamily: 'Raleway',
   textTheme: TextTheme(
      //H
      headline1: TextStyle(),
      headline2: TextStyle(fontSize: 47, fontWeight: FontWeight.w700),//market
      headline3: TextStyle(fontSize: 33, fontWeight: FontWeight.w600),
      headline4: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),//market
      headline5: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
      headline6: TextStyle(),
      //subtitles
      subtitle1: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      subtitle2: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),//Medium?
      //bodies
      bodyText1: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      bodyText2: TextStyle(fontSize: 14, fontWeight: FontWeight.w100),
      //Button
      button: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: colors.btnTextColor(1)),
      //caption
      caption: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: colors.sapphireTextColor(1)),
      //overline
      overline: TextStyle(),
    ),
);

final ThemeData lightTheme = ThemeData(
  //main
  brightness: Brightness.light,
  primaryColor: Colors.white,
  accentColor: const Color.fromRGBO(136, 143, 215, 1),

  backgroundColor: Colors.white,
  
  buttonColor: colors.btnColor(),

  buttonTheme: ButtonThemeData(
    buttonColor: colors.btnColor(),
  ),

  //text
  fontFamily: 'Raleway',
  
    textTheme: TextTheme(
      //H
      headline1: TextStyle(),
      headline2: TextStyle(fontSize: 47, fontWeight: FontWeight.w700),//market
      headline3: TextStyle(fontSize: 33, fontWeight: FontWeight.w600),
      headline4: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),//market
      headline5: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
      headline6: TextStyle(),
      //subtitles
      subtitle1: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      subtitle2: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),//Medium?
      //bodies
      bodyText1: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      bodyText2: TextStyle(fontSize: 14, fontWeight: FontWeight.w100),
      //Button
      button: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: colors.btnTextColor(1)),
      //caption
      caption: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: colors.sapphireTextColor(1)),
      //overline
      overline: TextStyle(),
    ),
);