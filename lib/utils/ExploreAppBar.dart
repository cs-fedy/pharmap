import 'package:flutter/material.dart';
import 'package:pharmap/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ExploreAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  const ExploreAppBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: bgColor,
      child: Container(
        margin: EdgeInsets.only(top: 6),
        height: height ,
        child: Column(
          children: [

            _exploreOptionList(context),
          ],
        ),
      ),
    );
  }

   Widget _exploreOptionList(BuildContext context) {
    return Container(
      height: (height - 20)/2,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: 10,
          ),
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
    );
  }

  Widget _exploreTiles({
    IconData icon,
    @required String title,
    @required BuildContext context,
  }) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(right: 5),
        padding: EdgeInsets.symmetric(horizontal: 5),
        height: ((height - 20))-10,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.white),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(
                      icon,
                      color: secondaryColor,
                    ),
                  )
                : SizedBox(),
            Text(
              title,
              style: TextStyle(
                color: darkPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);


}

