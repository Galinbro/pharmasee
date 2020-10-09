import 'package:farmasee/theme/theme.dart';
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
      body: Container(
        padding: const EdgeInsets.only(top: 0.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 100,
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Time',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: colors.grayDarkTextColor(1)),
                      ),
                    ),
                    Container(
                      height: 100,
                      child: Text(
                        '08:00',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: colors.grayTextColor(1)),
                      ),
                    ),
                    Container(
                      height: 100,
                      child: Text(
                        '09:00',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: colors.grayTextColor(1)),
                      ),
                    ),
                    Container(
                      height: 100,
                      child: Text(
                        '10:30',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: colors.grayTextColor(1)),
                      ),
                    ),
                    Container(
                      height: 100,
                      child: Text(
                        '11:30',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: colors.grayTextColor(1)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(top: 50),
                        height: 0.62 * size.height,
                        child: FAProgressBar(
                          direction: Axis.vertical,
                          backgroundColor: Colors.white,
                          progressColor: Colors.blue,
                          verticalDirection: VerticalDirection.down,
                          currentValue: 75,
                          displayText: '%',
                          border: Border.all(color: Colors.black),
                          borderRadius: 10,
                          size: 5,
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.0, -1.0),
                      end: Alignment(0.0,
                          -0.5), // 10% of the width, so there are ten blinds.
                      colors: [
                        const Color(0xffffffff),
                        const Color(0xffE1EBF6),
                      ], // red to yellow
                    ),
                  ),
                  padding: EdgeInsets.only(right: 80),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 70, top: 10),
                        height: 100,
                        child: Text(
                          'Events',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: colors.grayDarkTextColor(1)),
                        ),
                      ),
                      Container(
                        height: 100,
                        padding: EdgeInsets.only(left: 70),
                        child: Text(
                          'Your products have been ordered',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: colors.grayTextColor(1)),
                        ),
                      ),
                      Container(
                        height: 100,
                        padding: EdgeInsets.only(left: 70),
                        child: Text(
                          'Your products have arrived to the pharmacy',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: colors.grayTextColor(1)),
                        ),
                      ),
                      Container(
                        height: 100,
                        padding: EdgeInsets.only(left: 70),
                        child: Text(
                          'Package ready for delivery',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: colors.grayTextColor(1)),
                        ),
                      ),
                      Container(
                        height: 100,
                        padding: EdgeInsets.only(left: 70),
                        child: Text(
                          'Package has been delivered',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: colors.grayTextColor(1)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
      drawer: SideMenu(route: route),
    );
  }
}
