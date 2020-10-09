import 'package:flutter/material.dart';

import 'package:farmasee/src/bloc/home/home_bloc.dart';
import 'package:farmasee/src/bloc/provider_bloc.dart';

import 'package:farmasee/src/widgets/side_menu/side_menu.dart';
import 'package:farmasee/src/widgets/app_bar_widget.dart';

import 'package:farmasee/theme/theme.dart';
import 'package:farmasee/src/pages/tracker/FAProgressBar.dart';

class TrackerPage extends StatefulWidget {
  static const String route = 'tracker';
  static const String appbarText = 'Tracker';

  static const double borderRadious = 55.0;

  @override
  _TrackerPageState createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: SideMenu(route: TrackerPage.route),
      body: DefaultTabController(
        length: 5,
        child: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 50.0,
                  floating: false,
                  pinned: true,
                  title: Text("My Order", style: Theme.of(context).textTheme.headline5.copyWith(color: colors.whiteTextColor(1))),
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft:
                              Radius.circular(TrackerPage.borderRadious),
                          bottomRight:
                              Radius.circular(TrackerPage.borderRadious))),
                  leading: IconButton(
                    icon: Icon(Icons.menu),
                    color: colors.iconAppbarColor(),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                  backgroundColor: colors.backgroundColorBlue(),
                  flexibleSpace: Container(
                    decoration: new BoxDecoration(
                      color: colors.backgroundColorBlue(),
                      borderRadius: new BorderRadius.only(
                        bottomLeft:
                            const Radius.circular(TrackerPage.borderRadious),
                        bottomRight:
                            const Radius.circular(TrackerPage.borderRadious),
                      ),
                    ),
                    // child: _topWidgetText(context, size),
                  ),
                ),
                SliverPadding(
                  padding: new EdgeInsets.all(10.0),
                  sliver: new SliverList(
                    delegate: new SliverChildListDelegate([
                      _tabTitles(context),
                    ]),
                  ),
                ),
              ];
            },
            body: Container(
              height: size.height,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: TabBarView(
                children: [
                  _tracker(context, size),
                  _tracker(context, size),
                  _tracker(context, size),
                  _tracker(context, size),
                  _tracker(context, size),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _tracker(BuildContext context, Size size) {
    return Container(
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
                          .copyWith(
                              color: colors.grayDarkTextColor(1)),
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
                            .copyWith(
                                color: colors.grayDarkTextColor(1)),
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
                            .copyWith(
                                color: colors.grayTextColor(1)),
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
                            .copyWith(
                                color: colors.grayTextColor(1)),
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
                            .copyWith(
                                color: colors.grayTextColor(1)),
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
                            .copyWith(
                                color: colors.grayTextColor(1)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
    );
  }

  TabBar _tabTitles(BuildContext context) {
    return TabBar(
      labelColor: Colors.black87,
      unselectedLabelColor: Colors.grey,
      tabs: [
        Column(
          children: <Widget>[
            Text(
              "19",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              "Su",
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Text(
              "20",
              maxLines: 1,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              "Mon",
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Text(
              "21",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              "Tu",
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Text(
              "22",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              "We",
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Text(
              "23",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              "Thu",
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ],
    );
  }

}
