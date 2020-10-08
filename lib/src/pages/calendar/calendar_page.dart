import 'package:flutter/material.dart';

import 'package:farmasee/src/widgets/app_bar_widget.dart';
import 'package:farmasee/theme/theme.dart';

import 'package:farmasee/src/bloc/provider_bloc.dart';
import 'package:farmasee/src/bloc/appointment/appointment_bloc.dart';

import 'package:farmasee/src/widgets/side_menu/side_menu.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';

//import 'history_appointment_page.dart';
//import 'next_appointmnt_page.dart';

class MyCalendarPage extends StatelessWidget {
  static const String route = 'my-calendar';
  static const String appbarText = 'Calendar';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(appbarText, context),
      body: SafeArea(
        child: SfCalendar(),
      ),
      drawer: SideMenu(route: route),
    );
  }
/*
  @override
  Widget build(BuildContext context) {
    final MyAppointmentBloc bloc = BlocProvider.of(context).myAppointmentsBloc;
    print('build');
    return Scaffold(
      appBar: appBar(MyCalendar.appbarText, context),
      body: Container(
        color: colors.darkerBackgroundColor(),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 14.0),
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
                stream: bloc.counterStream,
                initialData: 0,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  if (snapshot.hasData) return _callPage(snapshot.data);
                  return const LinearProgressIndicator();
                },
              ),
            ))
          ],
        ),
      ),
      drawer: SideMenu(route: MyCalendar.route),
    );
  }

  Widget _callPage(int paginaActual) {
    switch (paginaActual) {
      case 0:
        return NextAppointmentPage();
      case 1:
        return HistoryAppointmentPage();

      default:
        return NextAppointmentPage();
    }
  }

  Widget _createBtns(BuildContext context, MyAppointmentBloc bloc) {
    return StreamBuilder<int>(
      stream: bloc.counterStream,
      initialData: 0,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _btnProx(context, snapshot.data, bloc),
            const SizedBox(width: 24.0),
            _btnHist(context, snapshot.data, bloc),
          ],
        );
      },
    );
  }

  Container _btnProx(BuildContext context, int index, MyAppointmentBloc bloc) {
    return Container(
      width: 135.0,
      decoration: BoxDecoration(
          color:
              index == 0 ? colors.btnActiveColor() : colors.btnNotActiveColor(),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: FlatButton(
          onPressed: () {
            bloc.changeCounter(0);
          },
          child: Text('Proximas',
              style: index == 0
                  ? Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: colors.blueTextColor(1))
                  : Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: colors.whiteTextColor(0.45)))),
    );
  }

  Container _btnHist(BuildContext context, int index, MyAppointmentBloc bloc) {
    return Container(
      width: 135.0,
      decoration: BoxDecoration(
          color:
              index == 1 ? colors.btnActiveColor() : colors.btnNotActiveColor(),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: FlatButton(
          onPressed: () {
            bloc.changeCounter(1);
          },
          child: Text('Historial',
              style: index == 1
                  ? Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: colors.blueTextColor(1))
                  : Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: colors.whiteTextColor(0.45)))),
    );
  }
  */
}
