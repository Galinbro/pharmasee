import 'package:flutter/material.dart';

import 'package:farmasee/theme/theme.dart';
import 'package:farmasee/theme/dinamic_colors.dart';

PreferredSizeWidget appBar(String appbarText, BuildContext context){

  final XplainColors colors = XplainColors();
  final List<String> texts = appbarText.split(' ');
  
  return PreferredSize(
    preferredSize: const Size.fromHeight(50.0),
    child: AppBar(
      backgroundColor: colors.backgroundColor(),
      iconTheme: IconThemeData(color: colors.iconAppbarColor()),
      actions: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children:appBarText(texts, context),
        )
      ],
    ),
  );
}

List<Widget> appBarText(List<String> list, BuildContext context){
  int count = list.length>1 ? -1 : 0;
  return list.map((String text){
    count++;
    return Container(
      margin: const EdgeInsets.only(right:17.0,),
      child: Text(
        text,
        // style: Theme.of(context).textTheme.headline5.copyWith(fontSize: count == 0 ? 15.0 : 25.0, fontWeight: FontWeight.bold)
        style: count == 0 ? Theme.of(context).textTheme.headline5.copyWith(color: colors.blueTextColor(1), fontWeight: FontWeight.bold, fontFamily: 'Market Fresh') : Theme.of(context).textTheme.headline4.copyWith(color: colors.blueTextColor(1)),
      ),
    );
  }).toList();
}
