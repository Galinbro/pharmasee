import 'package:farmasee/src/pages/prescription-detail/prescription-detail_page.dart';
import 'package:flutter/material.dart';

import 'package:farmasee/theme/theme.dart';

class MyPrescriptionWidget extends StatelessWidget {

  MyPrescriptionWidget({ @required this.info, @required this.tempTag, @required this.date, this.icons});

  final String info;
  final int tempTag;
  final String date;
  final List<Icon> icons;

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
      height: 96,
      child: _tarjeta(context)
    );
  }

  Widget _tarjeta( BuildContext context){

    final Row tarjeta = Row(
        children: <Widget>[
          
          // Container(

          //   margin: const EdgeInsets.only(left: 7.0),
          //   child: Hero(
          //     tag: tempTag,
          //     child: const CircleAvatar(
          //       radius: 35.0,
          //       // backgroundImage: NetworkImage( 'https://play-images-prod-cms.tech.tvnz.co.nz/api/v1/web/image/content/dam/images/entertainment/shows/p/person-of-interest/personofinterest_coverimg.png.2017-03-08T11:21:33+13:00.jpg?width=960&height=540' ),
          //     ),
          //   ),
          // ),

          Container(
            margin: const EdgeInsets.only(left: 16.0),
            
            child: Column(
              // padding: const EdgeInsets.only(bottom: 16.0),
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                
                Text(info, 
                  style:Theme.of(context).textTheme.bodyText1.copyWith(color: colors.whiteTextColor(1), fontSize: 18), 
                ),
                Padding(padding: const EdgeInsets.only(bottom: 5.0)),  
                
                Text(date, style: Theme.of(context).textTheme.caption.copyWith(color: colors.whiteTextColor(1), fontSize: 15)
                ),
                Padding(padding: const EdgeInsets.only(bottom: 5.0)),  
                Row(children: icons.map((item) => item).toList()
                ),  
              ],
              
            ),
            
          ),
          Padding(padding: const EdgeInsets.only(bottom: 5.0)), 
      ],
    );

    return InkWell(
      child: tarjeta,
      onTap: (){
    
        Navigator.push(context, MaterialPageRoute<Widget>(builder: (context) => PrescriptionDetail()));
      },
    );
  }

}