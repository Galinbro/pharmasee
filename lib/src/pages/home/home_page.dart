import 'package:flutter/material.dart';

import 'package:farmasee/src/widgets/side_menu/side_menu.dart';
import 'package:farmasee/src/widgets/app_bar_widget.dart';

class HomePage extends StatelessWidget {

  static const String route = 'home';
  static const String appbarText = 'Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(appbarText, context),
      body: Text('Homepage'),
      drawer: SideMenu(route: route),
    );
  }
}