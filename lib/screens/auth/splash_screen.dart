import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmap/components/custom_button.dart';
import 'package:pharmap/utils/constants.dart';

class SplashScreen extends StatelessWidget {
  static final String id = '/SplashScreen';

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 30.0,
          ),
          child: SizedBox(
            width: _size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    child: SvgPicture.asset(
                      "assets/Svg/pharmapIllustration.svg",
                      semanticsLabel: "pharmap illustration",
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'PHARMAP',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Text(
                        'clients do not easily find the medications they need resulting in a waste of time. This application helps the user to find a nearby pharmacy that contains the medicine they are looking for.',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      CustomButton(
                        text: "Login",
                        press: () =>
                            Navigator.pushNamed(context, '/LoginScreen'),
                        bgColor: primaryColor,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      CustomButton(
                        text: "Signup",
                        press: () =>
                            Navigator.pushNamed(context, '/SignupScreen'),
                        bgColor: secondaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
