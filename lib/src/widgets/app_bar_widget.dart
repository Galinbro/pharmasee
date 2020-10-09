import 'package:flutter/material.dart';

import 'package:farmasee/theme/theme.dart';
import 'package:farmasee/theme/dinamic_colors.dart';

PreferredSizeWidget appBar(String appbarText, BuildContext context){

  final XplainColors colors = XplainColors();
  final String text = appbarText;
  Size size = MediaQuery.of(context).size;

  return PreferredSize(
    preferredSize: const Size.fromHeight(80.0),
    child: AppBar(
      // centerTitle: true,
      backgroundColor: colors.appbarBackgroundColor(),
      elevation: 0.0,
      iconTheme: IconThemeData(color: colors.iconAppbarColor()),
    
      actions: <Widget>[
        Expanded(
          // Spacer(),
          child: Row(
            children: [
              
              Spacer(),
              Center(
                // Padding(padding: const EdgeInsets.only(top: 20.0)),
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.headline4.copyWith(color: colors.whiteTextColor(1), fontWeight: FontWeight.bold) ,
                ),
              ),
              Center(
                child: IconButton(icon: Icon(Icons.search, color: Colors.white), onPressed: null),
              ),
              Spacer(),
            ],
          ),
        )
      ],
    ),
  );
}


