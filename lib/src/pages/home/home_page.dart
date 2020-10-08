import 'package:flutter/material.dart';

import 'package:farmasee/src/widgets/side_menu/side_menu.dart';
import 'package:farmasee/src/widgets/app_bar_widget.dart';

import 'package:farmasee/theme/theme.dart';

class HomePage extends StatelessWidget {

  static const String route = 'home';
  static const String appbarText = 'Home';

  static const double borderRadious = 55.0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: SideMenu(route: route),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(borderRadious),
                      bottomRight: Radius.circular(borderRadious)
                    )
                ),
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
                      bottomLeft: const Radius.circular(borderRadious),
                      bottomRight: const Radius.circular(borderRadious),
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: Text("Good Morning", style: Theme.of(context).textTheme.headline4.copyWith(color: colors.whiteTextColor(1))),
                        left: size.width * 0.1,
                        top: size.height * 0.13,
                      ),
                      Positioned(
                        child: Text("Patty", style: Theme.of(context).textTheme.headline4.copyWith(color: colors.whiteTextColor(1))),
                        left: size.width * 0.1,
                        top: size.height * 0.18,
                      ),
                      Positioned(
                        child: Text("Completed", style: Theme.of(context).textTheme.caption.copyWith(color: colors.whiteTextColor(1))),
                        left: size.width * 0.7,
                        top: size.height * 0.11,
                      ),
                      Positioned(
                        child: Text("5/15", style: Theme.of(context).textTheme.headline4.copyWith(color: colors.whiteTextColor(1))),
                        left: size.width * 0.7,
                        top: size.height * 0.13,
                      ),
                      Positioned(
                        child: Container(
                          width: size.width * 0.6,
                          child: Text(
                            "Some random text pretty large so we see if its breaks when it overflow",
                            style: Theme.of(context).textTheme.caption.copyWith(color: colors.whiteTextColor(1)),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          ),
                        ),
                        left: size.width * 0.1,
                        top: size.height * 0.25,
                      ),
                      
                    ],
                  ),
                ),
              ),
              new SliverPadding(
                padding: new EdgeInsets.all(6.0),
                sliver: new SliverList(
                  delegate: new SliverChildListDelegate([
                    TabBar(
                      labelColor: Colors.black87,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        new Tab(icon: new Icon(Icons.info), text: "Tab 1"),
                        new Tab(
                            icon: new Icon(Icons.lightbulb_outline),
                            text: "Tab 2"),
                      ],
                    ),
                  ]),
                ),
              ),
            ];
          },
          body: Center(
            child: Text("Sample text"),
          ),
        ),
      ),
    );
  }
}