import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pharmap/screens/Signup_screen.dart';
import 'package:pharmap/screens/login_screen.dart';
import 'package:pharmap/screens/splash_screen.dart';
import 'package:pharmap/utils/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: textTheme,
        scaffoldBackgroundColor: bgColor,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.id,
      routes: <String, WidgetBuilder>{
        SplashScreen.id: (BuildContext context) => SplashScreen(),
        LoginScreen.id: (BuildContext context) => LoginScreen(),
        SignupScreen.id: (BuildContext context) => SignupScreen(),
      },
    );
  }
}
