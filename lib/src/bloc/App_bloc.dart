import 'prescription/prescription_bloc.dart';
import 'calendar/calendar_bloc.dart';
import 'package:farmasee/src/bloc/home/home_bloc.dart';

class AppBloc {
  AppBloc() {
    _myPrescriptions = MyPrescriptionBloc();
    _myCalendarDates = MyCalendarBloc();
    _home = HomeBloc();
  }

  MyPrescriptionBloc _myPrescriptions;
  MyCalendarBloc _myCalendarDates;
  HomeBloc _home;

  MyPrescriptionBloc get myPrescriptionsBloc => _myPrescriptions;
  MyCalendarBloc get myCalendarDatesBloc => _myCalendarDates;
  HomeBloc get homeBloc => _home;
}
