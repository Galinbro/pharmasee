

import 'prescription/prescription_bloc.dart';
import 'package:farmasee/src/bloc/home/home_bloc.dart';

class AppBloc {

  AppBloc() {
    _myPrescriptions = MyPrescriptionBloc();
    _home = HomeBloc();
  }
  
  MyPrescriptionBloc _myPrescriptions;
  HomeBloc _home;

  MyPrescriptionBloc  get myPrescriptionsBloc  => _myPrescriptions;
  HomeBloc  get homeBloc  => _home;
}