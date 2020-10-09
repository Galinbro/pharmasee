import 'package:flutter/material.dart';

import 'package:farmasee/src/widgets/app_bar_widget.dart';
import 'package:farmasee/theme/theme.dart';

import 'package:farmasee/src/widgets/side_menu/side_menu.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';

class MyCalendarPage extends StatelessWidget {
  static const String route = 'my-calendar';
  static const String appbarText = 'Calendar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(appbarText, context),
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: SfCalendar(
              view: CalendarView.month,
              showNavigationArrow: true,
              dataSource: MeetingDataSource(_getDataSource()),
              monthViewSettings: MonthViewSettings(showAgenda: true),
            ),
          ),
        ]),
      ),
      drawer: SideMenu(route: route),
    );
  }

  List<Meeting> _getDataSource() {
    var meetings = <Meeting>[];
    for (int i = 5; i < 30; i++) {
      meetings.add(Meeting('Amoxicillin (100 ml)', DateTime(2020, 10, i, 7, 30),
          DateTime(2020, 10, i, 8, 0), const Color(0xFF0F8644), false));
      meetings.add(Meeting(
          'Vitamin D (50,000 IU)',
          DateTime(2020, 10, i, 7, 30),
          DateTime(2020, 10, i, 8, 0),
          const Color(0xFF124BA2),
          false));
      if (i % 2 == 0) {
        meetings.add(Meeting(
            'Atorvastatin (10 mg)',
            DateTime(2020, 10, i, 7, 30),
            DateTime(2020, 10, i, 8, 0),
            const Color(0xFF01AEF0),
            false));
      }
    }

    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments[index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments[index].to;
  }

  @override
  String getSubject(int index) {
    return appointments[index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments[index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments[index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
