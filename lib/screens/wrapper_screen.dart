import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmap/components/bottom_nav_bar.dart';
import 'package:pharmap/screens/auth/splash_screen.dart';
import 'package:provider/provider.dart';

class WrapperScreen extends StatefulWidget {
  static final String id = '/WrapperScreen';
  @override
  _WrapperScreenState createState() => _WrapperScreenState();
}

class _WrapperScreenState extends State<WrapperScreen> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    if (user == null) {
      return SplashScreen();
    } else {
      return BottomNavBar();
    }
  }
}
