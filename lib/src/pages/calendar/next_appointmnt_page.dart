import 'package:flutter/material.dart';

import 'package:farmasee/src/widgets/my_appointment_widget.dart';

class NextAppointmentPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MyAppointmentWidget(info: 'Emilio', tempTag: 1),
        MyAppointmentWidget(info: 'Galindo', tempTag: 2),
        MyAppointmentWidget(info: 'Hayashi', tempTag: 3)
      ],
    );
  }
}