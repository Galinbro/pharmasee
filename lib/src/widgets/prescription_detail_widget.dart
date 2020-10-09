import 'package:flutter/material.dart';

import 'package:farmasee/theme/theme.dart';

class PrescriptionDetailWidget extends StatelessWidget {

  PrescriptionDetailWidget({ @required this.med, @required this.tempTag, @required this.time, @required this.disp, @required this.route});

  final String med;
  final int tempTag;
  final String time;
  final String disp;
  final String route;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.lightBlue, colors.backgroundColorBlue()]
              ),
           
        color: Colors.lightBlue,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2.5), // changes position of shadow
          ),
        ],
      ),
      // margin: const EdgeInsets.only(top: 14.0, right: 4.0),
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top:15),
      height: 120,
      child: _tarjeta(context)
    );
  }

  Widget _tarjeta( BuildContext context){

    final Row tarjeta = Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 16.0),
            
            child: Column(
              // padding: const EdgeInsets.only(bottom: 16.0),
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                  ],
                ),       
                Text(med, style:Theme.of(context).textTheme.bodyText1.copyWith(color: colors.whiteTextColor(1), fontSize: 18), 
                ),
                Padding(padding: const EdgeInsets.only(bottom: 5.0)), 
                Text(disp, style: Theme.of(context).textTheme.caption.copyWith(color: colors.whiteTextColor(1), fontSize: 15)
                ),
                 Padding(padding: const EdgeInsets.only(bottom: 5.0)),  
                Text(route, style: Theme.of(context).textTheme.caption.copyWith(color: colors.whiteTextColor(1), fontSize: 15)
                ),
                Padding(padding: const EdgeInsets.only(bottom: 5.0)),  
              
                Text(time, style: Theme.of(context).textTheme.caption.copyWith(color: colors.whiteTextColor(1), fontSize: 14)
                ),
              ],
            ),
          ),
      ],
    );

    return InkWell(
      child: tarjeta,
      onTap: (){
        // Navigator.push(context, MaterialPageRoute<Widget>(builder: (context) => PrescriptionDetail() ));
        
      },
    );
  }

}