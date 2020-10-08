import 'package:flutter/material.dart';

import 'package:farmasee/src/widgets/side_menu/side_menu.dart';
import 'package:farmasee/src/widgets/app_bar_widget.dart';

import 'FAProgressBar.dart';

class TrackerPage extends StatelessWidget {
  static const String route = 'tracker';
  static const String appbarText = 'Tracker';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(appbarText, context),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 100,
                      child: Text(
                        '       Time',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Container(
                      height: 100,
                      child: Text(
                        '       Time',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Container(
                      height: 100,
                      child: Text(
                        '       Time',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Container(
                      height: 100,
                      child: Text(
                        '       Time',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Container(
                      height: 100,
                      child: Text(
                        '       Time',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                        height: 0.62 * size.height,
                        child: FAProgressBar(
                          direction: Axis.vertical,
                          backgroundColor: Colors.white,
                          progressColor: Colors.blue,
                          verticalDirection: VerticalDirection.down,
                          currentValue: 50,
                          displayText: '%',
                          border: Border.all(color: Colors.black),
                          borderRadius: 10,
                          size: 5,
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 200,
                      child: Text(
                        'Events',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 150,
                      child: Text(
                        'Your products have been ordered',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 150,
                      child: Text(
                        'Your products have arrived to the pharmacy',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 150,
                      child: Text(
                        'Package ready for delivery',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 150,
                      child: Text(
                        'Package has been delivered',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
      ),
      drawer: SideMenu(route: route),
    );
  }
}
