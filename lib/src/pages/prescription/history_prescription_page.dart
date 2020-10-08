import 'package:flutter/material.dart';

import 'package:farmasee/src/widgets/my_prescription_widget.dart';

class HistoryPrescriptionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MyPrescriptionWidget(info: 'Jose', tempTag: 1),
        MyPrescriptionWidget(info: 'Marcelo', tempTag: 2),
        MyPrescriptionWidget(info: 'Galindo', tempTag: 3)
      ],
    );
  }
}