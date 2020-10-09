
import 'package:farmasee/src/bloc/prescription/prescription_bloc.dart';
import 'package:farmasee/src/bloc/provider_bloc.dart';
import 'package:farmasee/src/pages/tracker/tracker_page.dart';
import 'package:flutter/material.dart';

import 'package:farmasee/src/widgets/app_bar_widget.dart';
import 'package:farmasee/theme/theme.dart';
import 'current_p_detail_page.dart';

class PrescriptionDetail extends StatelessWidget {
  //PrescriptionDetail({Key key, @required this.info, @required this.date});
  // final String info;
  // final String date;
  static const String route = 'prescription-detail';
  static const String appbarText = 'My Prescriptions';
  @override
  Widget build(BuildContext context) {
     final MyPrescriptionBloc bloc = BlocProvider.of(context).myPrescriptionsBloc;
     final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(PrescriptionDetail.appbarText, context),
      body: 
      Container(
        // height: size.height,
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){

        },
        label: Text('Share'),
       
        backgroundColor: colors.backgroundColorBlue(),
        icon: Icon(Icons.share),
        
        
      ),
      // new RaisedButton(onPressed: null)
      // drawer: SideMenu(route: PrescriptionDetail.route),
    );
  }
}

 Widget _callPage( int paginaActual ) {
    return CurrentPrescriptionDetailPage();
  
  }
  
  Widget _createBtns(BuildContext context, MyPrescriptionBloc bloc) {
    return StreamBuilder<int>(
      stream: bloc.counterStream ,
      initialData: 0,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot){
        return Container(
          // padding: const EdgeInsets.only(right: 200.0),
          padding: const EdgeInsets.only(left: 10),
          color: Color(0xFF124BA2),
          child: Row(
            
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // _btnProx(context, snapshot.data, bloc),
              // const SizedBox(width: 0.0),
              _btnHist(context, snapshot.data, bloc),
              _texto(context, snapshot.data, bloc),
              const SizedBox(),
            ],
          ),
        );
      },
    );
  }


  Container _btnHist(BuildContext context, int index, MyPrescriptionBloc bloc){

    return Container(
      
      width: 160.0,
      decoration: BoxDecoration(
        color: Color(0XFF01AEF0).withOpacity(0.5),
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
            color: Colors.white
          )
          // style: index == 1 ? Theme.of(context).textTheme.bodyText1.copyWith(color: colors.blueTextColor(1)) : Theme.of(context).textTheme.bodyText1.copyWith(color: colors.whiteTextColor(0.45)) 
        ) 
      ),
    );
  }


Container _texto(BuildContext context, int index, MyPrescriptionBloc bloc){

    return Container(
      // padding: const EdgeInsets.only(right: 3),
      width: 150.0,
      height: 22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40)
        
      ),
      child: FlatButton(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
     ),

 
      // padding: EdgeInsets.all(8.0),
        color: Colors.lightBlue,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute<Widget>(builder: (context) => TrackerPage()));
        },
        child: Text(
          'Delivery Status',
          style: TextStyle(
            color: Colors.white,
          )
          // style: index == 1 ? Theme.of(context).textTheme.bodyText1.copyWith(color: colors.blueTextColor(1)) : Theme.of(context).textTheme.bodyText1.copyWith(color: colors.whiteTextColor(0.45)) 
        ) 
      ),
    );
  }

