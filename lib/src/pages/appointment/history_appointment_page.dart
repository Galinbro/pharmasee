import 'package:flutter/material.dart';

import 'package:farmasee/src/widgets/my_appointment_widget.dart';

class HistoryAppointmentPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MyAppointmentWidget(info: 'Jose', tempTag: 1),
        MyAppointmentWidget(info: 'Marcelo', tempTag: 2),
        MyAppointmentWidget(info: 'Galindo', tempTag: 3)
      ],
    );
  }
}