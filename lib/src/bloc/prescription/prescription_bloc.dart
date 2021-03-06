import 'dart:async';

class MyPrescriptionBloc{

  final StreamController<int> _counterController = StreamController<int>.broadcast();
  
  //recuperar los datos del stream
  Stream<int> get counterStream => _counterController.stream;

  //insertar valores al stream
  Function(int) get changeCounter => _counterController.sink.add;

  void dispose() {
    _counterController?.close();
  }
}