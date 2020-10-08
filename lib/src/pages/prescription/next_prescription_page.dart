import 'package:flutter/material.dart';

import 'package:farmasee/src/widgets/my_prescription_widget.dart';

class NextPrescriptionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MyPrescriptionWidget(info: 'Emilio', tempTag: 1),
        MyPrescriptionWidget(info: 'Galindo', tempTag: 2),
        MyPrescriptionWidget(info: 'Hayashi', tempTag: 3)
      ],
    );
  }
}