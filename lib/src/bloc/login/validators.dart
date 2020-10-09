import 'dart:async';



class Validators {


  final StreamTransformer<String, String> validarEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: ( String email, EventSink<String> sink ) {
      // Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      const String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      final RegExp regExp   = RegExp(pattern);

      if(email == ''){

      }else if ( regExp.hasMatch( email ) ) {
        sink.add( email );
      } else {
        sink.addError('Email format incorrect');
      }

    }
  );


  final StreamTransformer<String, String> validarPassword = StreamTransformer<String, String>.fromHandlers(
    handleData: ( String password, EventSink<String> sink ) {
      if (password.isEmpty){

      }else if ( password.length >= 8 ) {
        sink.add( password );
      } else {
        // sink.addError('Más de 6 caracteres por favor');
        sink.addError('Need more than 8 characters');
      }

    }
  );


}
