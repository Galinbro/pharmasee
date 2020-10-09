import 'package:farmasee/src/bloc/calendar/calendar_bloc.dart';
import 'package:flutter/material.dart';

import 'package:farmasee/src/widgets/app_bar_widget.dart';
import 'package:farmasee/theme/theme.dart';

import 'package:farmasee/src/bloc/provider_bloc.dart';

import 'package:farmasee/src/widgets/side_menu/side_menu.dart';
import 'package:rxdart/rxdart.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';

class MyCalendarPage extends StatelessWidget {
  static const String route = 'my-calendar';
  static const String appbarText = 'Calendar';
  var prescriptions = <Prescription>[];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final MyCalendarBloc bloc = BlocProvider.of(context).myCalendarDatesBloc;
    // In the future, add this from
    prescriptions.add(Prescription(
        'Amoxicillin',
        DateTime(2020, 10, 9, 3, 30),
        '110 ml',
        'Take one tablet every 24 hours.',
        DateTime(2021, 10, 9, 3, 30)));
    prescriptions.add(Prescription(
        'Amoxicillin',
        DateTime(2020, 10, 9, 7, 0),
        '110 ml',
        'Take one tablet every 24 hours.',
        DateTime(2021, 10, 8, 0, 0)));
    prescriptions.add(Prescription(
        'Amoxicillin',
        DateTime(2020, 10, 8, 0, 0),
        '110 ml',
        'Take one tablet every 24 hours.',
        DateTime(2021, 10, 8, 0, 0)));
    prescriptions.add(Prescription(
        'Amoxicillin',
        DateTime(2020, 10, 8, 12, 0),
        '110 ml',
        'Take one tablet every 24 hours.',
        DateTime(2021, 10, 8, 0, 0)));

    return Scaffold(
      appBar: appBar(appbarText, context),
      body: SafeArea(
        child: Column(children: [
          SizedBox(
            width: size.width,
            height: size.height / 2,
            child: SfCalendar(
              view: CalendarView.month,
              showNavigationArrow: true,
              dataSource: MeetingDataSource(_getDataSource()),
              monthViewSettings: MonthViewSettings(
                  appointmentDisplayMode:
                      MonthAppointmentDisplayMode.appointment),
            ),
          ),
          Expanded(
            child: StreamBuilder<int>(
              stream: bloc.counterStream,
              initialData: 0,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                if (snapshot.hasData)
                  return _buildMedicationScrollView(snapshot.data);
                return const LinearProgressIndicator();
              },
            ),
          ),
        ]),
      ),
      drawer: SideMenu(route: route),
    );
  }

  SingleChildScrollView _buildMedicationScrollView(int snapshot) {
    return SingleChildScrollView(
      child: Column(children: _buildPrescriptionCards()),
    );
  }

  List<Widget> _buildPrescriptionCards() {
    return prescriptions.map((prescription) {
      return _buildCard(
          prescription.medName,
          DateFormat('MM-dd-yyyy').format(prescription.expDate),
          prescription.amount,
          prescription.instructions);
    }).toList();
  }

  Center _buildCard(
      String medName, String expDate, String amount, String instructions) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.medical_services),
              title: Text(
                  "Prescription " + expDate + "\n" + medName + " " + amount),
              subtitle: Text(instructions),
            ),
          ],
        ),
      ),
    );
  }

  List<Meeting> _getDataSource() {
    var meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));

    meetings.add(Meeting(
        //TODO: Match up with medication cards below
        'Conference',
        startTime,
        endTime,
        const Color(0xFF0F8644),
        false));
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

class Prescription {
  Prescription(this.medName, this.takeDate, this.amount, this.instructions,
      this.expDate);
  String medName;
  DateTime takeDate;
  String amount;
  String instructions;
  DateTime expDate;
}
