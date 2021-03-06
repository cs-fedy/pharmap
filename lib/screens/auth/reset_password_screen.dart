

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmap/components/custom_button.dart';
import 'package:pharmap/components/custom_text_form_field.dart';
import 'package:pharmap/services/auth.dart';
import 'package:pharmap/utils/constants.dart';

class ResetPasswordScreen extends StatefulWidget {
  static final String id = '/ResetPasswordScreen';
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthService auth = AuthService();
  String emailAddress = '';
  String error = '';
  bool isSigningIn = false;

  void _handleSubmit() async {
    setState(() {
      error = '';
      isSigningIn = true;
    });
    _formKey.currentState.save();
    if (emailAddress.trim() == '') {
      setState(() {
        isSigningIn = false;
        error = "email is required";
      });
    } else {
      await auth.sendVerificationEmail(emailAddress);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'Reset password',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Container(
                    child: SvgPicture.asset("assets/Svg/Forgot password-pana.svg",
                    semanticsLabel: "pharmap illustration",
                    height: 360, 
                     width: 360,
                    ),
                  ),
                  
                  Text(
                      'Enter your email to get a verfication\ncode and reset your password',
                      style:TextStyle(
                        color: darkPrimaryColor,
                      ),
                      
                      ),
                  SizedBox(height: 50.0),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor.withAlpha(40),
                          blurRadius: 20.0,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: CustomTextFormField(
                      hintText: "Email Address",
                      autovalidate: false,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (newValue) => emailAddress = newValue,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    error != '' ? error : '',
                    style: TextStyle(color: dangerColor),
                  ),
                  SizedBox(height: 20.0),
                  CustomButton(
                    text: isSigningIn ? 'loading...' : 'Get verification code',
                    bgColor: primaryColor,
                    press: isSigningIn ? () {} : _handleSubmit,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
