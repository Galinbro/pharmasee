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
  bool val1 = false;
  bool val2 = false;
  bool val3 = false;
  bool val4 = false;
  bool val5 = false;

  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = BlocProvider.of(context).homeBloc;
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
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
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
                    child: _topWidgetText(context, size),
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
            body: Stack(children: [
              Align(
                alignment: Alignment.center,
                child: FadeInImage(
                    fit: BoxFit.cover,
                    height: size.height * 0.2,
                    placeholder: const AssetImage('assets/images/logo.png'),
                    image: const AssetImage('assets/images/logo.png')),
              ),
              Container(
                height: size.height,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Container(
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
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  ListTile _listTile(String time, String text, bool value) {
    return ListTile(
        leading: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 50,
              minHeight: 50,
              maxWidth: 50,
              maxHeight: 50,
            ),
            child: Center(
                child:
                    Text(time, style: Theme.of(context).textTheme.bodyText1))),
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 3.0),
              child: Icon(
                Icons.circle,
                size: 10.0,
                color: value ? colors.backgroundColorBlue() : Colors.red,
              ),
            ),
            Icon(
              Icons.circle,
              color: colors.backgroundColorBlue(),
            ),
            Text(
              " $text",
            ),
          ],
        ),
        trailing: Checkbox(
            checkColor: colors.backgroundColorBlue(),
            activeColor: Colors.white,
            value: value,
            onChanged: (value) {
              setState(() {
                switch (time) {
                  case "07:00":
                    val1 = value;
                    break;
                  case "08:00":
                    val2 = value;
                    break;
                  case "09:00":
                    val3 = value;
                    break;
                  case "10:00":
                    val4 = value;
                    break;
                  case "11:00":
                    val5 = value;
                    break;
                }
              });
            }
            // controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
            ));
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

  Stack _topWidgetText(BuildContext context, Size size) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: Text("Good Morning",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: colors.whiteTextColor(1))),
          left: size.width * 0.1,
          top: size.height * 0.13,
        ),
        Positioned(
          child: Text("Patty",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: colors.whiteTextColor(1))),
          left: size.width * 0.1,
          top: size.height * 0.175,
        ),
        Positioned(
          child: Text("Completed",
              style: Theme.of(context)
                  .textTheme
                  .caption
                  .copyWith(color: colors.whiteTextColor(1))),
          left: size.width * 0.7,
          top: size.height * 0.11,
        ),
        Positioned(
          child: Text("5/15",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: colors.whiteTextColor(1))),
          left: size.width * 0.7,
          top: size.height * 0.13,
        ),
        Positioned(
          child: Container(
            width: size.width * 0.6,
            child: Text(
              "Some random text pretty large so we see if its breaks when it overflow",
              style: Theme.of(context)
                  .textTheme
                  .caption
                  .copyWith(color: colors.whiteTextColor(1)),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          left: size.width * 0.1,
          top: size.height * 0.23,
        ),
      ],
    );
  }
}
