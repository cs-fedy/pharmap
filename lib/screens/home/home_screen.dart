import 'package:flutter/material.dart';
import 'package:pharmap/components/custom_button.dart';
import 'package:pharmap/services/auth.dart';
import 'package:pharmap/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  static final String id = '/HomeScreen';
  final AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Center(
            child: CustomButton(
              bgColor: secondaryColor,
              text: 'sign out',
              press: () async {
                await auth.signout();
                Navigator.pushReplacementNamed(context, '/WrapperScreen');
              },
            ),
          ),
        ),
      ),
    );
  }
}