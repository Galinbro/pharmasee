import 'appointment/appointment_bloc.dart';

class AppBloc {

  AppBloc() {
    _myAppointments = MyAppointmentBloc();
  }
  
  MyAppointmentBloc _myAppointments;

  MyAppointmentBloc  get myAppointmentsBloc  => _myAppointments;
}