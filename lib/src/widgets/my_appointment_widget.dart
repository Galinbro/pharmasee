import 'package:flutter/material.dart';

import 'package:farmasee/theme/theme.dart';

class MyAppointmentWidget extends StatelessWidget {

  MyAppointmentWidget({ @required this.info, @required this.tempTag});

  final String info;
  final int tempTag;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors.backgroundColor(),
        borderRadius: const BorderRadius.all(Radius.circular(0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2.5), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.only(top: 14.0, right: 4.0),
      height: 96,
      child: _tarjeta(context)
    );
  }

  Widget _tarjeta( BuildContext context){

    final Row tarjeta = Row(
        children: <Widget>[

          Container(
            margin: const EdgeInsets.only(left: 18.0),
            child: Hero(
              tag: tempTag,
              child: const CircleAvatar(
                radius: 35.0,
                backgroundImage: NetworkImage( 'https://play-images-prod-cms.tech.tvnz.co.nz/api/v1/web/image/content/dam/images/entertainment/shows/p/person-of-interest/personofinterest_coverimg.png.2017-03-08T11:21:33+13:00.jpg?width=960&height=540' ),
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.only(left: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Principios de programacion ',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(color: colors.blueTextColor(1))
                    ),
                    Text('con', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black))
                  ],
                ),       
                Text(info, style: Theme.of(context).textTheme.bodyText1.copyWith(color: colors.blueTextColor(1))),
                Text('14 de maio 5:00 a 7:00 pm', style: Theme.of(context).textTheme.caption.copyWith(color: colors.blackTextColor(0.6))),
              ],
            ),
          ),
      ],
    );

    return InkWell(
      child: tarjeta,
      onTap: (){
        // Navigator.push(context, MaterialPageRoute<Widget>(builder: (context) => DetalleMentoriaPage(tempTag: tempTag) ));
      },
    );
  }

}