
import 'prescription/prescription_bloc.dart';

class AppBloc {

  AppBloc() {
    _myPrescriptions = MyPrescriptionBloc();
  }
  
  MyPrescriptionBloc _myPrescriptions;

  MyPrescriptionBloc  get myPrescriptionsBloc  => _myPrescriptions;
}