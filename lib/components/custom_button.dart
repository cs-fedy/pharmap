import 'package:flutter/material.dart';
import 'package:pharmap/utils/constants.dart';

class CustomButton extends StatelessWidget {
const CustomButton({Key key, this.text, this.press, this.bgColor, this.width})
      : super(key: key);
  final String text;
  final Function press;
  final Color bgColor;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width != null? width: double.infinity,
      height: 45,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: this.bgColor,
        onPressed: press,
        child: Text(
          text,
          style: buttonTextStyle,
        ),
      ),
    );
  }
}
