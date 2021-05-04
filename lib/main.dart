import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/pref_constants.dart';
import 'ui/home_drawer.dart';

Future<Null> main() async {
  SharedPreferences.getInstance().then((prefs) {
    runApp(MyApp(prefs: prefs));
  });
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  MyApp({this.prefs});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Bus Booking App',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        //controller
//          MyRoutes.SIGNIN: (context) => SignInScreen(),
//          MyRoutes.SIGNUP: (context) => SignUpScreen(),
//          MyRoutes.FORGOT_PASSWORD: (context) => ForgotPasswordScreen(),
//          MyRoutes.VIEW_HOME: (context) => ViewSports(),
      },
      theme: new ThemeData(primaryColor: Colors.white),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
