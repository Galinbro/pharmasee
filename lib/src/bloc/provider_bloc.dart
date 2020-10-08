import 'package:flutter/material.dart';


import 'package:farmasee/src/bloc/App_bloc.dart';
export 'package:farmasee/src/bloc/App_bloc.dart';

class BlocProvider extends InheritedWidget {

  factory BlocProvider({ Key key, Widget child }) {

    _instancia ??= BlocProvider._internal(key: key, child: child );
    return _instancia;
  }

  BlocProvider._internal({ Key key, Widget child })
    : super(key: key, child: child );

  static BlocProvider _instancia;

  final AppBloc bloc = AppBloc();

  // BlocProvider({ Key key, Widget child })
  //   : super(key: key, child: child );

 
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static AppBloc of ( BuildContext context ) {
    return context.dependOnInheritedWidgetOfExactType<BlocProvider>().bloc;
  }

}