import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  List<String> errors = [];
  bool isSigningIn = false;

  void _handleSubmit() async {
    setState(() {
      errors = [];
      isSigningIn = true;
    });
    _formKey.currentState.save();
    dynamic user =
        await auth.signInWithEmailAndPassword(emailAddress, password);
    if (user is User) {
      Navigator.pushReplacementNamed(context, '/WrapperScreen');
    } else {
      setState(() {
        errors.add(user);
        isSigningIn = false;
      });
    }
  }

  void _handleGoogleSignIn() async {
    setState(() => isSigningIn = true);
    
    User user = await auth.signInWithGoogle('signup');
    if (user != null) {
      Navigator.pushReplacementNamed(context, '/WrapperScreen');
    }
  }

  void _handleTwitterSignIn() async {
    print('sign in with twitter');
  }

  void _handleFacebookSignIn() async {
    print('sign in with facebook');
  }

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
                  SizedBox(height: 10.0),


                  
                  Container(
                    child: SvgPicture.asset("assets/svg/login.svg",
                    semanticsLabel: "pharmap illustration",
                    height: 360, 
                     width: 360,
                    ),
                  ),
                  

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
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      children: errors
                          .map(
                            (element) => Text(
                              element,
                              style: TextStyle(color: dangerColor),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  CustomButton(
                    text: isSigningIn ? 'loading...' : 'Login',
                    bgColor: primaryColor,
                    press: isSigningIn ? () {} : _handleSubmit,
                  ),
                  SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context)
                            .pushNamed('/ResetPasswordScreen'),
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: secondaryColor,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () =>
                            Navigator.of(context).pushNamed('/SignupScreen'),
                        child: Text(
                          "You don't have an account?",
                          style: TextStyle(
                            color: secondaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 100.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "or sign in with",
                        style:TextStyle(
                          color:darkPrimaryColor,
                        )
                        ),
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
