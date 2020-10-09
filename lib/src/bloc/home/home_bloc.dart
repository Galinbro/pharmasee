import 'dart:async';

class HomeBloc{

  final StreamController<bool> _boolController = StreamController<bool>.broadcast();
  
  //recuperar los datos del stream
  Stream<bool> get boolStream => _boolController.stream;

  //insertar valores al stream
  Function(bool) get changeBool => _boolController.sink.add;

  void dispose() {
    _boolController?.close();
  }
}