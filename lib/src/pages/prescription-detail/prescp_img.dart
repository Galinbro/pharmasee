
import 'package:flutter/material.dart';

import 'package:farmasee/theme/theme.dart';




class PrescriptionImg extends StatelessWidget {
  // static const String appbarText = 'Prescription';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Prescription', style: TextStyle(color: colors.whiteTextColor(1))),
        // style: TextStyle(color: colors.whiteTextColor(1)),
        backgroundColor: colors.appbarBackgroundColor() ,
         elevation: 0.0,
          iconTheme: IconThemeData(color: colors.iconAppbarColor()),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: new Image.asset('assets/images/prescp-detail.png',
              width: size.width,
              height: size.height,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}