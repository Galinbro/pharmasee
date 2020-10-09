import 'package:flutter/material.dart';
import 'package:farmasee/theme/theme.dart';
import 'package:farmasee/src/widgets/my_prescription_widget.dart';

class MyRecordPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MyPrescriptionWidget(info: 'Dr. Galindo', tempTag: 0, date: '09/09/2020 02:20 PM - 04:00 PM',
        icons: [
            Icon(Icons.add_alert_outlined, color: colors.whiteTextColor(1),),
            Icon(Icons.no_drinks_outlined, color: colors.whiteTextColor(1),),
            Icon(Icons.receipt_outlined,  color: colors.whiteTextColor(1),),
            ],),
        MyPrescriptionWidget(info: 'Dr. Galindo', tempTag: 1, date: '09/09/2020 02:20 PM - 04:00 PM',
        icons: [
            Icon(Icons.add_alert_outlined,  color: colors.whiteTextColor(1),),
            Icon(Icons.receipt_outlined,  color: colors.whiteTextColor(1),),
            ],),
        MyPrescriptionWidget(info: 'Dr. Hayashi', tempTag: 2, date: '09/09/2019 02:20 PM - 04:00 PM',
        icons: [
            Icon(Icons.done_all, color: colors.whiteTextColor(1),),
            ],),
        MyPrescriptionWidget(info: 'Dra. Canales', tempTag: 3, date: '09/09/2019 02:20 PM - 04:00 PM',
        icons: [
            Icon(Icons.done_all, color: colors.whiteTextColor(1),),
            ],),
        MyPrescriptionWidget(info: 'Dra. Canales', tempTag: 3, date: '09/09/2019 02:20 PM - 04:00 PM',
        icons: [
            Icon(Icons.done_all, color: colors.whiteTextColor(1),),
            ],)
      ],
    );
  }
}