import 'package:flutter/material.dart';

import 'package:farmasee/src/widgets/side_menu/rutas/rutas.dart';
import 'package:farmasee/theme/dinamic_colors.dart';
import 'package:farmasee/utils/icons_utils.dart';

class SideMenu extends StatelessWidget {
  
  SideMenu({this.route});

  final XplainColors colors = XplainColors();
  final String route;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: colors.backgroundColor(),
        child: ListView(
          padding: EdgeInsets.zero,
          children: _options(context),
        ),
      ),
    );
  }
  List<Widget> _options(BuildContext context){

    final List<Map<String, String>> dataBefore = getRoutes();
    final List<Map<String, String>> dataAfter = getRoutesAfter();
    
    final List<Widget> list = [];
    
    list.add(_drawerHeader(context));
    
    dataBefore.forEach((Map<String, String> element) {
      final bool isSelect = element['ruta'] == route ? true : false;
      final Container widgetTemp = Container(
        margin: const EdgeInsets.only(right: 14.0),
        decoration: BoxDecoration(
          color: isSelect ? colors.drawerSelectedColor() : colors.backgroundColor(),
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(20),
            topRight: Radius.circular(20)
          )
        ),
        child: _iconListTile(context, element, isSelect),
      );
      
      // list..add(widgetTemp)
      //     ..add( Divider() );
      list.add(widgetTemp);
    
    });
    
    list.add(_blueDivider());

    dataAfter.forEach((Map<String, String> element) {
      final bool isSelect = element['ruta'] == route ? true : false;
      final Container widgetTemp = Container(
        margin: const EdgeInsets.only(right: 14.0),
        decoration: BoxDecoration(
          color: isSelect ? colors.drawerSelectedColor() : colors.backgroundColor(),
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(20),
            topRight: Radius.circular(20)
          )
        ),
        child: _noIconListTile(context, element, isSelect),
      );
      list.add(widgetTemp);
    });
    return list;
  }

  Container _noIconListTile(BuildContext context, Map<String, String> element, bool isSelect) {
    return Container(
        margin: const EdgeInsets.only(left: 30.0),
        child: ListTile(
          title: Text(
            element['texto'],
            style: Theme.of(context).textTheme.bodyText1.copyWith(color: isSelect ? colors.drawerSelectedTextColor() : colors.drawerNotSelectedTextColor()),
          ),
          onTap: isSelect ? (){Navigator.pop(context);} : (){
            Navigator.pop(context);
            Navigator.pushNamed(context, element['ruta']);
          },
        ),
      );
  }

  Container _iconListTile(BuildContext context, Map<String, String> element, bool isSelect) {
      return Container(
        margin: const EdgeInsets.only(left: 30.0),
        child: ListTile(
          title: Text(
            element['texto'],
            style: Theme.of(context).textTheme.bodyText1.copyWith(color: isSelect ? colors.drawerSelectedTextColor() : colors.drawerNotSelectedTextColor()),
          ),
          leading: getDrawerIcon(element['icon'], isSelect),
          onTap: isSelect ? (){Navigator.pop(context);} : (){
            Navigator.pop(context);
            Navigator.pushNamed(context, element['ruta']);
          },
        ),
      );
  }

  DrawerHeader _drawerHeader(BuildContext context) {
    return DrawerHeader(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      child: Column(
        children: <Widget>[
          
          Expanded(child: Container()),
          
          _avatarAndName(context),

          _blueDivider()
          


        ],
      ),
    );
  }

  Row _avatarAndName(BuildContext context) {
    return Row(
          children: <Widget>[
            _avatar(),
            _name(context),
          ],
        );
  }

  Container _avatar() {
    return Container(
      margin: const EdgeInsets.only(left: 30.0),
      width: 70.0,
      height: 70.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: FadeInImage(
          fit: BoxFit.cover,
          placeholder: const AssetImage('assets/images/no-image.png'),
          image: const AssetImage('assets/images/image.jpg')
        ),
      ),
    );
  }

  Container _name(BuildContext context) {
    return Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Emilio Galindo', style: Theme.of(context).textTheme.headline5.copyWith(color: colors.backgroundColorBlue())),
                Text('My profile', style: Theme.of(context).textTheme.caption.copyWith(color: colors.backgroundColorBlue())),
              ],
            ),
          );
  }

  Container _blueDivider() {
    return Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25.0),
            height: 1.5,
            decoration: BoxDecoration(
              color: colors.dividerColor(),
              borderRadius: const BorderRadius.all(Radius.circular(20))
            ),
          ),
        );
  }

}
