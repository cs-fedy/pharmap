import 'package:flutter/material.dart';
import 'package:pharmap/models/user_model.dart';
import 'package:pharmap/screens/auth/splash_screen.dart';
import 'package:pharmap/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

class WrapperScreen extends StatefulWidget {
  static final String id = '/WrapperScreen';
  @override
  _WrapperScreenState createState() => _WrapperScreenState();
}

class _WrapperScreenState extends State<WrapperScreen> {
  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserModel>(context);
    print(user != null);
    if (user == null) {
      return SplashScreen();
    } else {
      return HomeScreen();
    }
  }
}
