import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmap/components/custom_button.dart';
import 'package:pharmap/components/custom_text_form_field.dart';
import 'package:pharmap/components/login_with_social_media.dart';
import 'package:pharmap/services/auth.dart';
import 'package:pharmap/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  static final String id = '/LoginScreen';
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthService auth = AuthService();
  String emailAddress;
  String password;

  void _handleSubmit() async {
    _formKey.currentState.save();
    // TODO: verify user input
    // TODO: make sure that the user exist in the db
    final User user =
        await auth.signInWithEmailAndPassword(emailAddress, password);
    if (user != null) {
      Navigator.pushReplacementNamed(context, '/HomeScreen');
    }
  }

  void _handleGoogleSignIn() async {
    // TODO: make sure user doesn't exist in the db
    User user = await auth.signInWithGoogle('signup');
    if (user != null) {
      Navigator.pushReplacementNamed(context, '/OptionScreen');
    }
  }

  void _handleTwitterSignIn() async {
    print('sign in with twitter');
  }

  void _handleFacebookSignIn() async {
    print('sign in with facebook');
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
                    'Welcome back!\nLogin to continue',
                    style: Theme.of(context).textTheme.headline2,
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
                    child: Column(
                      children: [
                        CustomTextFormField(
                          hintText: "Email Address",
                          autovalidate: false,
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (newValue) => emailAddress = newValue,
                        ),
                        CustomTextFormField(
                          hintText: "Password",
                          autovalidate: false,
                          isPassword: true,
                          obscureText: true,
                          onSaved: (newValue) => password = newValue,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  CustomButton(
                    text: 'Login',
                    bgColor: primaryColor,
                    press: _handleSubmit,
                  ),
                  SizedBox(height: 30.0),
                  InkWell(
                    onTap: () =>
                        Navigator.of(context).pushNamed('/ResetPasswordScreen'),
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: secondaryColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 100.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('or sign in with'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LoginWithSocialMedia(
                            assetsPath: 'assets/icons/google.svg',
                            label: 'google logo',
                            onTap: _handleGoogleSignIn,
                          ),
                          LoginWithSocialMedia(
                            assetsPath: 'assets/icons/facebook.svg',
                            label: 'facebook logo',
                            onTap: _handleFacebookSignIn,
                          ),
                          LoginWithSocialMedia(
                            assetsPath: 'assets/icons/twitter.svg',
                            label: 'twitter logo',
                            onTap: _handleTwitterSignIn,
                          ),
                        ],
                      ),
                    ],
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
