import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static final String id = '/loginScreen';
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("login screen"),
      ),
    );
  }
}
