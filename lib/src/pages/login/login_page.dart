import 'package:farmasee/src/pages/signup/signup_page.dart';
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
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            _crearFondo( context ),
            _loginForm( context, size ),

          ],
        ),
      )
    );
  }

  Widget _crearFondo(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(
        color: colors.backgroundColorBlue(),
      )
    );

  }

  Widget _loginForm(BuildContext context, Size size) {

    final LoginBloc bloc = BlocProvider.of(context).loginBloc;
    final Size size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.center,
      child: Container(
        height: size.height*0.8,
        width: size.width*0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(30)
          )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: size.height*0.05),
                child: FadeInImage(
                  fit: BoxFit.cover,
                  height: size.height * 0.15,
                  placeholder: const AssetImage('assets/images/logo.png'),
                  image: const AssetImage('assets/images/logo.png')
                ),
              ),
              Container(
                width: size.width * 0.85,
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: <Widget>[
                    Text('Get started!', style: Theme.of(context).textTheme.headline3.copyWith(color: colors.backgroundColorBlue(), fontWeight: FontWeight.bold)),
                    Center(child: Text('Read to start the day?', style: Theme.of(context).textTheme.subtitle1.copyWith(color: colors.backgroundColorBlue()), textAlign: TextAlign.center,)),
                    const SizedBox(height: 20.0),
                      _createEmail(bloc, size),
                    const SizedBox(height: 20.0),
                      _createPassaword(bloc, size),
                    const SizedBox(height: 25.0),
                      _createBtn(bloc),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 20,
                child: FlatButton(
                  child: Text('Sign up now', style: Theme.of(context).textTheme.button.copyWith(color: colors.textColor())),
                  onPressed: (){
                    bloc.reseat();
                    Navigator.push(context, MaterialPageRoute<void>(builder: (context) => SignupPage() ));
                  } 
                ),
              ),
              FlatButton(
                height: 20,
                child: Text('Forgot password', style: Theme.of(context).textTheme.button.copyWith(decoration: TextDecoration.underline, color: colors.textColor())),
                onPressed: (){} 
              ),

              const SizedBox(height: 100.0)
            ],
          ),
        ),
      ),
    );
  }


  Widget _createEmail(LoginBloc bloc, Size size){

    return StreamBuilder<String>(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot){
        
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          // height: 40.0,
          width: size.width * 0.75,
          child: TextField(
            style: TextStyle(color: colors.textFieldTextColor(), height: 0.1,),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              fillColor: colors.backgroundColorBlueAlpha(0.6),
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

  Widget _createPassaword(LoginBloc bloc, Size size){

    return StreamBuilder<String>(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot){

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          // height: 40.0,
          width: size.width * 0.75,
          child: TextField(
            style: TextStyle(color: colors.textFieldTextColor(), height: 0.1,),
            obscureText: true,
            decoration: InputDecoration(
              fillColor: colors.backgroundColorBlueAlpha(0.6),
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
          height: 40.0,
          margin: const EdgeInsets.symmetric(horizontal: 70.5),
          child: RaisedButton(
            color: Theme.of(context).buttonColor,
            child: Container(
              // height: 40.0,
              padding: const EdgeInsets.symmetric( horizontal: 35.0, vertical: 10.0),
              child: Text('Log In', style: Theme.of(context).textTheme.button, textAlign: TextAlign.center)
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
