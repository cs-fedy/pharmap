import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pharmap/components/custom_button.dart';
import 'package:pharmap/components/custom_text_form_field.dart';
import 'package:pharmap/components/login_with_social_media.dart';
import 'package:pharmap/utils/constants.dart';

class SignupScreen extends StatefulWidget {
  static final String id = '/signupScreen';
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String fullName;
  String emailAddress;
  int phoneNumber;
  String password;
  bool obscurePassword = true;

  void _handleSubmit() async {
    // TODO: verify user input
    _formKey.currentState.save();
    print(emailAddress);
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    User createdUser = userCredential.user;
    print("email ${createdUser.email}, uid ${createdUser.uid}");
  }

  void _handleGoogleSignIn() async {
    print('sign in with google');
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Register to\nGet started!',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(height: 50.0),
                  CustomTextFormField(
                    autovalidate: false,
                    fieldLabel: "Full Name",
                    onSaved: (String newValue) => fullName = newValue,
                  ),
                  SizedBox(height: 20.0),
                  CustomTextFormField(
                    autovalidate: false,
                    fieldLabel: "Email Address",
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (String newValue) => emailAddress = newValue,
                  ),
                  SizedBox(height: 20.0),
                  CustomTextFormField(
                    autovalidate: false,
                    fieldLabel: "Phone Number",
                    onSaved: (String newValue) =>
                        phoneNumber = int.parse(newValue),
                  ),
                  SizedBox(height: 20.0),
                  CustomTextFormField(
                    autovalidate: false,
                    fieldLabel: "Password",
                    isPassword: true,
                    obscureText: true,
                    onSaved: (String newValue) => password = newValue,
                  ),
                  SizedBox(height: 20.0),
                  CustomButton(
                    text: 'continue',
                    bgColor: primaryColor,
                    press: _handleSubmit,
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Already have an account?'),
                      InkWell(
                        child: Text('sign In'),
                        onTap: () =>
                            Navigator.of(context).pushNamed('/loginScreen'),
                      ),
                    ],
                  ),
                  SizedBox(height: 100.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('or sign up with'),
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
