import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmap/components/custom_button.dart';
import 'package:pharmap/utils/constants.dart';

class SuccessScreen extends StatelessWidget {
  final String text;
  SuccessScreen({this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: [
              Text(text),
              SizedBox(
                height: 15.0,
              ),
              CustomButton(
                text: "return to explore screen",
                bgColor: dangerColor,
                press: () =>
                    Navigator.pushReplacementNamed(context, "/ExloreScreen"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
