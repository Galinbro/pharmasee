import 'package:flutter/material.dart';

import 'package:farmasee/src/widgets/app_bar_widget.dart';
import 'package:farmasee/theme/theme.dart';

import 'package:farmasee/src/bloc/provider_bloc.dart';
import 'package:farmasee/src/bloc/prescription/prescription_bloc.dart';

import 'package:farmasee/src/widgets/side_menu/side_menu.dart';

import 'history_prescription_page.dart';
import 'next_prescription_page.dart';


class MyPrescriptionHomePage extends StatelessWidget {

  static const String route = 'prescriptions';
  static const String appbarText = 'My Prescriptions';
  
  @override
  Widget build(BuildContext context) {
    final MyPrescriptionBloc bloc = BlocProvider.of(context).myPrescriptionsBloc;
    print('build');
    return Scaffold(
      appBar: appBar(MyPrescriptionHomePage.appbarText, context),
      body: Container(
        color: colors.darkerBackgroundColor(),
        child: Column(
          children: <Widget>[
            //  SizedBox(height: 20.0, child: Container(color: Color(0xFF124BA2)), ),
            
            _createBtns(context, bloc),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: colors.backgroundColor(),
                  borderRadius: const BorderRadius.all(Radius.circular(0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                padding: const EdgeInsets.only(top: 19),
                child: StreamBuilder<int>(
                  stream: bloc.counterStream ,
                  initialData: 0,
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot){
                    if (snapshot.hasData)
                      return _callPage(snapshot.data);
                    return const LinearProgressIndicator();
                  },
                ),
              )
            )
          ],
        ),
      ),
      drawer: SideMenu(route: MyPrescriptionHomePage.route),
    );
  }

  Widget _callPage( int paginaActual ) {

    switch( paginaActual ) {

      case 0: return NextPrescriptionPage();
      case 1: return HistoryPrescriptionPage();

      default:
        return NextPrescriptionPage();
    }

  }
  
  Widget _createBtns(BuildContext context, MyPrescriptionBloc bloc) {
    return StreamBuilder<int>(
      stream: bloc.counterStream ,
      initialData: 0,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot){
        return Container(
          color: Color(0xFF124BA2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _btnProx(context, snapshot.data, bloc),
              const SizedBox(width: 24.0),
              _btnHist(context, snapshot.data, bloc),
            ],
          ),
        );
      },
    );
  }

  Container _btnProx(BuildContext context, int index, MyPrescriptionBloc bloc) {
    return Container(
      width: 160.0,
      decoration: BoxDecoration(
        color: index == 0 ? colors.btnActiveColor() : colors.btnNotActiveColor(),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10)
        )
      ),
      child: FlatButton(
        onPressed: (){
          bloc.changeCounter(0);
        },
        child: Text(
          'Current Prescription',
          style: TextStyle(
            color: Color(0xFF124BA2),
          )
          // style: index == 0 ? Theme.of(context).textTheme.bodyText1.copyWith(color: colors.blueTextColor(1)) :Theme.of(context).textTheme.bodyText1.copyWith(color: colors.whiteTextColor(0.45))
        )
      ),
    );
  }

  Container _btnHist(BuildContext context, int index, MyPrescriptionBloc bloc){

    return Container(
      width: 160.0,
      decoration: BoxDecoration(
        color: index == 1 ? colors.btnActiveColor() : colors.btnNotActiveColor(),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10)
        )
      ),
      child: FlatButton(
        onPressed: (){
          bloc.changeCounter(1);
        },
        child: Text(
          'My Record',
          style: TextStyle(
            color: Color(0xFF124BA2),
          )
          // style: index == 1 ? Theme.of(context).textTheme.bodyText1.copyWith(color: colors.blueTextColor(1)) : Theme.of(context).textTheme.bodyText1.copyWith(color: colors.whiteTextColor(0.45)) 
        ) 
      ),
    );
  }

}
