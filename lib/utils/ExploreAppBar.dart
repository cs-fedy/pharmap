import 'package:flutter/material.dart';
import 'package:pharmap/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExploreAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 6),
      child: _exploreOptionList(context),
    );
  }

  Widget _exploreOptionList(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _exploreTiles(
              icon: FontAwesomeIcons.pills,
              title: 'Capsules',
              context: context,
            ),
            _exploreTiles(
              icon: FontAwesomeIcons.tablets,
              title: 'Tablet',
              context: context,
            ),
            _exploreTiles(
              title: 'Liquid',
              context: context,
            ),
            _exploreTiles(
              title: 'Injections',
              context: context,
            ),
            _exploreTiles(
              title: 'Drops',
              context: context,
            ),
            _exploreTiles(
              title: 'Inhalers',
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _exploreTiles({
    IconData icon,
    @required String title,
    @required BuildContext context,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon != null ? Icon(icon, color: secondaryColor) : SizedBox(),
          Text(
            title,
            style:
                TextStyle(color: darkPrimaryColor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
