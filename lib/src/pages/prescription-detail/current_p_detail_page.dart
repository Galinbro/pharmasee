import 'package:farmasee/src/widgets/prescription_detail_widget.dart';
import 'package:flutter/material.dart';


class CurrentPrescriptionDetailPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        PrescriptionDetailWidget(med: 'Amoxicilin', tempTag: 1, time: 'Every 8 hours - 14 days', disp: 'disp: 20 250mg capsules', route:'route: PO' ),
        PrescriptionDetailWidget(med: 'Cyclobenzaprine', tempTag: 2, time: 'Every 6 hours - 14 days', disp: 'disp: 1 100mg capsules', route:'route: PO' ),
      ],
    );
  }
}