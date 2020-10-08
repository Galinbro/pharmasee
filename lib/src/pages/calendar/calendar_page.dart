import 'package:flutter/material.dart';

import 'package:farmasee/src/widgets/app_bar_widget.dart';
import 'package:farmasee/theme/theme.dart';

import 'package:farmasee/src/bloc/provider_bloc.dart';

import 'package:farmasee/src/widgets/side_menu/side_menu.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';

//import 'history_appointment_page.dart';
//import 'next_appointmnt_page.dart';

class MyCalendarPage extends StatelessWidget {
  static const String route = 'my-calendar';
  static const String appbarText = 'Calendar';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(appbarText, context),
      body: SafeArea(
        child: SfCalendar(),
      ),
      drawer: SideMenu(route: route),
    );
  }
}
