import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pharmap/screens/auth/Signup_screen.dart';
import 'package:pharmap/screens/auth/login_screen.dart';
import 'package:pharmap/screens/auth/option_screen.dart';
import 'package:pharmap/screens/auth/reset_password_screen.dart';
import 'package:pharmap/screens/auth/splash_screen.dart';
import 'package:pharmap/screens/home/pay_screen.dart';
import 'package:pharmap/screens/wrapper_screen.dart';
import 'package:pharmap/services/auth.dart';
import 'package:pharmap/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:pharmap/screens/search/search_screen.dart';
import 'package:pharmap/screens/search/about_drug_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        theme: ThemeData(
          textTheme: textTheme,
          scaffoldBackgroundColor: bgColor,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: WrapperScreen.id,
        routes: <String, WidgetBuilder>{
          WrapperScreen.id: (BuildContext context) => WrapperScreen(),
          SplashScreen.id: (BuildContext context) => SplashScreen(),
          LoginScreen.id: (BuildContext context) => LoginScreen(),
          ResetPasswordScreen.id: (BuildContext context) =>
              ResetPasswordScreen(),
          SignupScreen.id: (BuildContext context) => SignupScreen(),
          OptionScreen.id: (BuildContext context) => OptionScreen(),
          PayScreen.id: (BuildContext context) => PayScreen(),
          AboutDrugScreen.id: (BuildContext context) => AboutDrugScreen(),
          SearchScreen.id: (BuildContext context) => SearchScreen(),
        },
      ),
    );
  }
}
