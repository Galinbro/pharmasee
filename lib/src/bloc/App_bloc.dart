import 'package:farmasee/src/bloc/login/login_bloc.dart';

import 'prescription/prescription_bloc.dart';
import 'calendar/calendar_bloc.dart';
import 'package:farmasee/src/bloc/home/home_bloc.dart';

class AppBloc {
  AppBloc() {
    _myPrescriptions = MyPrescriptionBloc();
    _myCalendarDates = MyCalendarBloc();
    _home = HomeBloc();
    _login = LoginBloc();
  }

  MyPrescriptionBloc _myPrescriptions;
  MyCalendarBloc _myCalendarDates;
  HomeBloc _home;
  LoginBloc _login;

  MyPrescriptionBloc get myPrescriptionsBloc => _myPrescriptions;
  MyCalendarBloc get myCalendarDatesBloc => _myCalendarDates;
  HomeBloc get homeBloc => _home;
  LoginBloc get loginBloc => _login;
}
