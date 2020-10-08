import 'package:flutter/material.dart';

import 'package:farmasee/src/pages/settings/routes/routes.dart';

import 'package:farmasee/src/widgets/side_menu/side_menu.dart';
import 'package:farmasee/src/widgets/app_bar_widget.dart';
import 'package:farmasee/theme/theme.dart';


class SettingHomePage extends StatelessWidget {
  
  static const String route = 'settings';
  static const String appbarText = 'Configuracion';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(appbarText, context),
      body: Container(
        color: colors.darkerBackgroundColor(),
        child: ListView(
            // children: _listTile(context),
            children: _listTile(context)
          ),
      ),
      drawer: SideMenu(route: SettingHomePage.route),
    );
  }
  
  List<Widget> _listTile(BuildContext context) {
    final Map<String, List<Map<String, String>>> data = getRoutes();

    final List<Widget> list = [];

    data.forEach((String key, List<Map<String, String>> value) {
      list.add(_title(context, key));
      list.add(_items(context, value)); 
    });

    return list;
  }
  
  Container _title(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.only(left: 30.0, top: 28, bottom: 10.0),
      child: Text(title, style: Theme.of(context).textTheme.bodyText1.copyWith(color:colors.blackTextColor(0.5)))
    );
  }

  Container _items(BuildContext context, List<Map<String, String>> list) {
  return Container(
      decoration: BoxDecoration(
        color: colors.backgroundColor(),
        borderRadius: const BorderRadius.all(Radius.circular(0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: colors.shadowColor(0.8),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2.5), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.only(bottom: 24.0),
      child: Container(
        margin: const EdgeInsets.only(left: 20.0),
        child: Material(
          color: colors.backgroundColor(),
          child: Column(
            children: _item(list, context)
          ),
        ),
      )
    );
  }

  List<Widget> _item(List<Map<String, String>> list, BuildContext context) {
    final List<Widget> tiles = [];
    int count = 0;
    list.forEach((Map<String, String> element) {
      final ListTile widget = ListTile(
        title: Text(element['texto'], style: Theme.of(context).textTheme.bodyText1.copyWith(color:colors.blueTextColor(1)) ),
        onTap: (){
          Navigator.pushNamed(context, element['ruta']);
        },
        trailing: Icon(Icons.chevron_right, size: 25, color: colors.drawerNotSelectedIconColor()),
      );
      tiles.add(widget);
      if (list.length-1 != count)
        tiles.add(_blueDivider());
      // tiles.add(Container(margin: const EdgeInsets.only(top: 13.0)));
      count++;
    });
    return tiles;
  }

  Container _blueDivider() {
    return Container(
          child: Container(
            height: 1.0,
            decoration: BoxDecoration(
              color: colors.dividerColor(),
              borderRadius: const BorderRadius.all(Radius.circular(20))
            ),
          ),
        );
  }
}
