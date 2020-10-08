import 'package:flutter/material.dart';

import 'package:farmasee/src/widgets/side_menu/side_menu.dart';
import 'package:farmasee/src/widgets/app_bar_widget.dart';

import 'package:farmasee/src/providers/theme_provider.dart';
import 'package:farmasee/theme/theme.dart';
import 'package:provider/provider.dart';

import 'home_settings_page.dart';

class PantallaSonidoPage extends StatelessWidget {

  static const String route = 'settings';
  static const String appbarText = 'Configuracion';
  
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger  = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: appBar(appbarText, context),
      body: Column(
        children: <Widget>[
          FlatButton(
              child: Text('Dark Theme'),
              onPressed: () {
                _themeChanger.setTheme(darkTheme, true);
              } 
          ),
          FlatButton(
              child: Text('Light Theme'),
              onPressed: (){
                _themeChanger.setTheme(lightTheme, false);
              } 
          ),
        ],
      ),
      drawer: SideMenu(route: SettingHomePage.route),
    );
  }
}
