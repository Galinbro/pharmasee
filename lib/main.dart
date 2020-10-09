import 'package:farmasee/src/pages/calendar/calendar_page.dart';
import 'package:farmasee/src/pages/login/login_page.dart';
import 'package:farmasee/src/pages/signup/signup_page.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:farmasee/theme/theme.dart';
import 'package:farmasee/src/bloc/provider_bloc.dart';
import 'package:farmasee/src/providers/theme_provider.dart';
import 'package:farmasee/src/user_preferences/user_preference.dart';

import 'src/pages/home/home_page.dart';
import 'package:farmasee/src/pages/settings/screen_sound_page.dart';
import 'package:farmasee/src/pages/settings/home_settings_page.dart';
import 'package:farmasee/src/pages/prescription/prescription_page.dart';
import 'package:farmasee/src/pages/tracker/tracker_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final UserPreferences prefs = UserPreferences();
  await prefs.initPrefs();

  runApp(PharmaseeFlutter());
}

class PharmaseeFlutter extends StatelessWidget {
  // This Widget is the root of Xplain Flutter Project
  final UserPreferences _prefs = UserPreferences();
  @override
  Widget build(BuildContext context) {
    print('root');
    return BlocProvider(
      child: ChangeNotifierProvider<ThemeChanger>(
        builder: (_) =>
            _prefs.theme ? ThemeChanger(darkTheme) : ThemeChanger(lightTheme),
        child: const MaterialAppTheme(),
      ),
    );
  }
}

class MaterialAppTheme extends StatelessWidget {
  const MaterialAppTheme({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('MaterialApp');
    final ThemeChanger theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pharmasee',
      initialRoute: 'login',
      routes: {
        // 'splash-screen'     : ( BuildContext context ) => SplashScreenPage(),
        'login'             : (BuildContext context) => LoginPage(),
        'signup'            : (BuildContext context) => SignupPage(),
        'home'              : (BuildContext context) => HomePage(),
        'prescriptions'     : (BuildContext context) => MyPrescriptionHomePage(),
        'settings'          : (BuildContext context) => SettingHomePage(),
        //setings
        'pantalla-sonido'   : (BuildContext context) => PantallaSonidoPage(),
        'my-calendar'       : (BuildContext context) => MyCalendarPage(),
        'tracker'           : (BuildContext context) => TrackerPage(),
      },
      theme: theme.getTheme(),
    );
  }
}

// import 'package:farmasee/src/pages/appointment/appointment_page.dart';
// import 'package:flutter/material.dart';

// import 'package:farmasee/src/pages/home/home_page.dart';
// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Farmasee',
//       initialRoute: '/',
//       routes: {
//         '/'                 : (BuildContext context) => HomePage(),
//         'my-appointment'    : (BuildContext context) => MyPrescriptionHomePage(),
//       },
//     );
//   }
// }
