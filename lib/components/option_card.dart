import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OptionCard extends StatelessWidget {
  final Function onTap;
  final String label;
  final String assetPath;
  OptionCard({this.onTap, this.label, this.assetPath});

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Column(
          children: [
            Container(
              width: _size.width * .5,
              child: FittedBox(
                child: SvgPicture.asset(
                  assetPath,
                  semanticsLabel: label,
                ),
                fit: BoxFit.fill,
              ),
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}
