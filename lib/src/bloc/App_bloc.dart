
import 'prescription/prescription_bloc.dart';
import 'calendar/calendar_bloc.dart';

class AppBloc {

  AppBloc() {
    _myPrescriptions = MyPrescriptionBloc();
    _myCalendarDates = MyCalendarBloc();
  }
  
  MyPrescriptionBloc _myPrescriptions;
  MyCalendarBloc _myCalendarDates;

  MyPrescriptionBloc  get myPrescriptionsBloc  => _myPrescriptions;
  MyCalendarBloc get myCalendarDatesBloc => _myCalendarDates;
}