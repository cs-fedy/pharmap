import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmap/utils/constants.dart';

class LoginWithSocialMedia extends StatelessWidget {
  String assetsPath;
  String label;
  Function onTap;
  LoginWithSocialMedia({this.assetsPath, this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: primaryColor),
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: SvgPicture.asset(
          assetsPath,
          semanticsLabel: label,
        ),
      ),
      onTap: onTap,
    );
  }
}
