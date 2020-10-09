import 'package:flutter/material.dart';

import 'package:farmasee/src/bloc/home/home_bloc.dart';
import 'package:farmasee/src/bloc/provider_bloc.dart';

import 'package:farmasee/src/widgets/side_menu/side_menu.dart';
import 'package:farmasee/src/widgets/app_bar_widget.dart';

import 'package:farmasee/theme/theme.dart';

class HomePage extends StatelessWidget {

  static const String route = 'home';
  static const String appbarText = 'Home';

  static const double borderRadious = 55.0;
  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc =
        BlocProvider.of(context).homeBloc;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: SideMenu(route: route),
      body: DefaultTabController(
        length: 5,
        child: SafeArea(
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
                              maxLines: 2,
                            ),
                          ),
                          left: size.width * 0.1,
                          top: size.height * 0.23,
                        ),
                        
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: new EdgeInsets.all(10.0),
                  sliver: new SliverList(
                    delegate: new SliverChildListDelegate([
                      TabBar(
                        labelColor: Colors.black87,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Column(
                            children: <Widget>[
                              Text("19", style: Theme.of(context).textTheme.bodyText1,),
                              Text("Su", style: Theme.of(context).textTheme.caption,),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text("20", maxLines: 1, style: Theme.of(context).textTheme.bodyText1,),
                              Text("Mon", style: Theme.of(context).textTheme.caption,),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text("21", style: Theme.of(context).textTheme.bodyText1,),
                              Text("Tu", style: Theme.of(context).textTheme.caption,),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text("22", style: Theme.of(context).textTheme.bodyText1,),
                              Text("We", style: Theme.of(context).textTheme.caption,),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text("23", style: Theme.of(context).textTheme.bodyText1,),
                              Text("Thu", style: Theme.of(context).textTheme.caption,),
                            ],
                          ),

                        ],
                      ),
                    ]),
                  ),
                ),
              ];
            },
            body: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: TabBarView(
                children: [
                  ListView(
                    children: <Widget>[
                      _listTile(bloc, "7:00", "Cortisona"),
                      _listTile(bloc, "8:00", "Cortisona"),
                      _listTile(bloc, "9:00", "Cortisona"),
                      _listTile(bloc, "10:00", "Cortisona"),
                      _listTile(bloc, "11:00", "Cortisona"),
                      _listTile(bloc, "12:00", "Cortisona"),
                      _listTile(bloc, "13:00", "Cortisona"),
                      _listTile(bloc, "14:00", "Cortisona"),
                    ],
                  ),
                  ListView(
                    children: <Widget>[
                      _listTile(bloc, "7:00", "Cortisona"),
                      _listTile(bloc, "8:00", "Cortisona"),
                      _listTile(bloc, "9:00", "Cortisona"),
                    ],
                  ),
                  ListView(
                    children: <Widget>[
                      _listTile(bloc, "12:00", "Cortisona"),
                      _listTile(bloc, "13:00", "Cortisona"),
                    ],
                  ),
                  ListView(
                    children: <Widget>[
                      _listTile(bloc, "10:00", "Cortisona"),
                      _listTile(bloc, "11:00", "Cortisona"),
                    ],
                  ),
                  ListView(
                    children: <Widget>[
                      _listTile(bloc, "7:00", "Cortisona"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  StreamBuilder<bool> _listTile(HomeBloc bloc, String time, String text) {
    return StreamBuilder<bool>(
      stream: bloc.boolStream ?? false ,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot){
        return ListTile(
          leading: Text(time, style: Theme.of(context).textTheme.bodyText1),
          title: Row(
            children: [
              Icon(Icons.circle, color: colors.backgroundColorBlue(),),
              Text(" $text"),
            ],
          ),
          trailing: Checkbox(
            value: snapshot.data ?? false,
            onChanged: (newValue) => bloc.changeBool(newValue),
            // controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
          )
        );
      },
    );
  }
}