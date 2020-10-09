import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'validators.dart';

class SignupBloc with Validators{


  final BehaviorSubject<String> _emailController    = BehaviorSubject<String>();
  final BehaviorSubject<String> _passwordController = BehaviorSubject<String>();

  //recuperar los datos del stream
  Stream<String> get emailStream    => _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);

  Stream<bool> get formValidStream => 
    CombineLatestStream.combine2(emailStream, passwordStream, (dynamic a, dynamic b) => true);
  
  //insertar valores al stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Obtener el último valor ingresado a los streams
  String get email    => _emailController.value;
  String get password => _passwordController.value;
  
  void dispose() { 
    _emailController?.close();
    _passwordController?.close();
    print('dispose login bloc');
  }

  void reseat(){
    changeEmail('');
    changePassword('');
  }

  void submitError(){
    _emailController.sink.addError('Not a valid Email');
    _passwordController.sink.addError('Incorrect password');
  }

}