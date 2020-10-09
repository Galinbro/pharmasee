import 'package:farmasee/src/bloc/signup/signup_bloc.dart';
import 'package:farmasee/src/pages/login/login_page.dart';
import 'package:flutter/material.dart';

import 'package:farmasee/src/bloc/provider_bloc.dart';
import 'package:farmasee/src/bloc/login/login_bloc.dart';

import 'package:farmasee/theme/dinamic_colors.dart';

enum SingingCharacter { male, female }

class SignupPage extends StatefulWidget {

  // final API _api = API();
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final XplainColors colors = XplainColors();
  SingingCharacter _character = SingingCharacter.male;
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    print('Signup');
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

    final SignupBloc bloc = BlocProvider.of(context).signupBloc;
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
                    Text('Welcome Back!', style: Theme.of(context).textTheme.headline3.copyWith(color: colors.backgroundColorBlue(), fontWeight: FontWeight.bold)),
                    Center(child: Text('Read to start the day?', style: Theme.of(context).textTheme.subtitle1.copyWith(color: colors.backgroundColorBlue()), textAlign: TextAlign.center,)),
                    const SizedBox(height: 25.0),
                    _createUsername(bloc, size),
                    const SizedBox(height: 20.0),
                      _createEmail(bloc, size),
                    const SizedBox(height: 20.0),
                      _createPassaword(bloc, size),
                    const SizedBox(height: 20.0),
                      _createPassawordConfirm(bloc, size),
                    const SizedBox(height: 20.0),
                      _createDate(bloc, size),
                    const SizedBox(height: 2.0),
                    _gender(context),
                    _terms(context),
                      _createBtn(bloc),
                    
                  ],
                ),
              ),
              // SizedBox(
              //   height: 40,
              // ),
              Container(
                height: 20,
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already register? ', style: Theme.of(context).textTheme.button.copyWith(color: colors.textColor())),
                      Text('Log in now', style: Theme.of(context).textTheme.button.copyWith(decoration: TextDecoration.underline, color: colors.textColor())),
                    ],
                  ),
                  onPressed: (){
                    bloc.reseat();
                    Navigator.push(context, MaterialPageRoute<void>(builder: (context) => LoginPage() ));
                  } 
                ),
              ),

              const SizedBox(height: 100.0)
            ],
          ),
        ),
      ),
    );
  }

  Row _terms(BuildContext context) {
    return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        checkColor: colors.backgroundColorBlue(),
                        activeColor: Colors.white,
                        value: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                            });
                        },
                        // controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                      ),
                      Text("By signing up I agree to the terms.", style: Theme.of(context).textTheme.caption.copyWith(color: colors.grayTextColor(1))),
                    ],
                  );
  }

  Row _gender(BuildContext context) {
    return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: SingingCharacter.male,
                        groupValue: _character,
                        onChanged: (SingingCharacter value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      Text("Male", style: Theme.of(context).textTheme.bodyText1),
                      Radio(
                        value: SingingCharacter.female,
                        groupValue: _character,
                        onChanged: (SingingCharacter value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      Text("Female", style: Theme.of(context).textTheme.bodyText1),
                    ],
                  );
  }

    Widget _createDate(SignupBloc bloc, Size size){

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
              hintText: 'March 4 2020',
              hintStyle: TextStyle(color: colors.textFieldTextColor()),
              labelText: 'Date of Birth',
              labelStyle: TextStyle(color: colors.textFieldTextColor()),
              errorText: false ? snapshot.error.toString() : null,
              border: OutlineInputBorder(
                borderSide: false ? BorderSide(color: Colors.red): BorderSide.none,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
            ),
            // onChanged: bloc.changeEmail,
          ),
        );

      },
    );
  }

  Widget _createUsername(SignupBloc bloc, Size size){

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
              hintText: 'Emilio Galindo',
              hintStyle: TextStyle(color: colors.textFieldTextColor()),
              labelText: 'Name',
              labelStyle: TextStyle(color: colors.textFieldTextColor()),
              errorText: false ? snapshot.error.toString() : null,
              border: OutlineInputBorder(
                borderSide: snapshot.hasError ? BorderSide(color: Colors.red): BorderSide.none,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
            ),
            // onChanged: bloc.changeEmail,
          ),
        );

      },
    );
  }

  Widget _createEmail(SignupBloc bloc, Size size){

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
              hintText: 'example@atos.com',
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

  Widget _createPassaword(SignupBloc bloc, Size size){

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

  Widget _createPassawordConfirm(SignupBloc bloc, Size size){

    return StreamBuilder<String>(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot){

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          width: size.width * 0.75,
          child: TextField(
            style: TextStyle(color: colors.textFieldTextColor(), height: 0.1,),
            obscureText: true,
            decoration: InputDecoration(
              fillColor: colors.backgroundColorBlueAlpha(0.6),
              filled: true,
              labelText: 'Confirm Password',
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

  Widget _createBtn(SignupBloc bloc){

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
              child: Text('Sign Up', style: Theme.of(context).textTheme.button, textAlign: TextAlign.center)
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

  void _login(SignupBloc bloc, BuildContext context) /*async*/{
    
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
