import 'package:flutter/material.dart';

import 'package:farmasee/src/bloc/provider_bloc.dart';
import 'package:farmasee/src/bloc/login/login_bloc.dart';

import 'package:farmasee/theme/dinamic_colors.dart';

class LoginPage extends StatelessWidget {

  // final API _api = API();
  final XplainColors colors = XplainColors();

  @override
  Widget build(BuildContext context) {
    print('Login');
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _crearFondo( context ),
          _loginForm( context, size ),

        ],
      )
    );
  }

  Widget _crearFondo(BuildContext context) {
    
    return Container(
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage('assets/images/login/login.png'), fit: BoxFit.cover),
      // ),
    );

  }

  Widget _loginForm(BuildContext context, Size size) {

    final LoginBloc bloc = BlocProvider.of(context).loginBloc;
    final Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          
          SafeArea(
            child: Container(
              height: size.height * 0.1,
            )
          ),
          
          Container(
            width: size.width * 0.85,
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: <Widget>[
                Text('Welcome Back!', style: Theme.of(context).textTheme.headline3.copyWith(color: colors.textColor())),
                Center(child: Text('Estas muy cerca de lograr el futuro que quieres', style: Theme.of(context).textTheme.subtitle1.copyWith(color: colors.textColor()), textAlign: TextAlign.center,)),
                const SizedBox(height: 55.0),
                Center(child: Text('Ingresa tu correo del ITAM', style: Theme.of(context).textTheme.subtitle2.copyWith(color: colors.textColor()), textAlign: TextAlign.center,)),
                const SizedBox(height: 15.0),
                  _createEmail(bloc),
                const SizedBox(height: 20.0),
                  _createPassaword(bloc),
                const SizedBox(height: 55.0),
                  _createBtn(bloc),
              ],
            ),
          ),
          
          FlatButton(
            child: Text('Forgot password', style: Theme.of(context).textTheme.button.copyWith(decoration: TextDecoration.underline, color: colors.textColor())),
            onPressed: (){} 
          ),

          FlatButton(
            child: Text('Registrarse', style: Theme.of(context).textTheme.button.copyWith(color: colors.textColor())),
            onPressed: (){
              bloc.reseat();
              // Navigator.push(context, MaterialPageRoute<void>(builder: (context) => RegisterPage() ));
            } 
          ),

          const SizedBox(height: 100.0)
        ],
      ),
    );
  }
  
  Widget _createEmail(LoginBloc bloc){

    return StreamBuilder<String>(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot){
        
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          // height: 40.0,
          child: TextField(
            style: TextStyle(color: colors.textFieldTextColor()),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              fillColor: colors.textFieldColor(),
              filled: true,
              hintText: 'example@xplain.com',
              hintStyle: TextStyle(color: colors.textFieldTextColor()),
              labelText: 'Email',
              labelStyle: TextStyle(color: colors.textFieldTextColor()),
              errorText: snapshot.hasError ? snapshot.error.toString() : null,
              border: OutlineInputBorder(
                borderSide: snapshot.hasError ? BorderSide(color: Colors.red): BorderSide.none,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
            ),
            onChanged: bloc.changeEmail,
          ),
        );

      },
    );
  }

  Widget _createPassaword(LoginBloc bloc){

    return StreamBuilder<String>(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot){

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          // height: 40.0,
          child: TextField(
            style: TextStyle(color: colors.textFieldTextColor()),
            obscureText: true,
            decoration: InputDecoration(
              fillColor: colors.textFieldColor(),
              filled: true,
              labelText: 'Password',
              labelStyle: TextStyle(color: colors.textFieldTextColor()),
              errorText: snapshot.hasError ? snapshot.error.toString() : null,
              border: OutlineInputBorder(
                borderSide: snapshot.hasError ? BorderSide(color: Colors.red): BorderSide.none,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
            ),
            onChanged: bloc.changePassword,
          ),
        );  
      },
    );
  }

  Widget _createBtn(LoginBloc bloc){

    return StreamBuilder<dynamic>(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
        
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 70.5),
          child: RaisedButton(
            color: Theme.of(context).buttonColor,
            child: Container(
              height: 43.0,
              padding: const EdgeInsets.symmetric( horizontal: 35.0, vertical: 12.5),
              child: Text('Iniciar Sesion', style: Theme.of(context).textTheme.button, textAlign: TextAlign.center)
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)
            ),
            elevation: 0.0,
            onPressed: (snapshot.hasData) ? ()=> _login(bloc, context) : (){}
          ),
        );
      },
    );    
  }

  void _login(LoginBloc bloc, BuildContext context) /*async*/{
    
    // Navigator.pushReplacementNamed(context, 'home');
    // Map info = await _api.student.login.login(bloc.email, bloc.password);
  
    if (/*info['ok'] as bool*/true){
      bloc.dispose();
      Navigator.pushReplacementNamed(context, 'home');
    }else {
      bloc.submitError();
      // utils.mostrarAlerta(context, info['token']);
    }
    
  }
}
