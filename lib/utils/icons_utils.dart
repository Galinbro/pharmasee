import 'package:farmasee/theme/theme.dart';
import 'package:flutter/material.dart';

final Map<String, IconData> _icons = <String, IconData>{
  ''              : null,
  'home'          : Icons.home,
  'list'          : Icons.list,
  'notification'  : Icons.notifications,
  'calendar'     : Icons.today,
  'favorito'      : Icons.favorite_border,
  'pagos'         : Icons.credit_card,
  'settings'      : Icons.settings,
};




Icon getDrawerIcon( String nombreIcono, bool isSelected ) {

  if (isSelected)
    return Icon( _icons[nombreIcono], color: colors.drawerSelectedIconColor(), size: 35 );
  else
    return Icon( _icons[nombreIcono], color: colors.drawerNotSelectedIconColor(), size: 35 );
}