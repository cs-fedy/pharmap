import 'package:flutter/material.dart';
import 'package:pharmap/utils/constants.dart';
import 'image_title.dart';
import 'look_for_pharmacies.dart';
import 'description.dart';
import 'package:pharmap/models/drug.dart';

class Body extends StatelessWidget {
  final Drug drug;

  const Body({Key key, this.drug}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: size.height * 0.4),
                    height: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                     child: Column(
                    children: <Widget>[
                      Description(drug: drug),
                      SizedBox(height: kDefaultPaddin / 2),
                      LookForPharmacies(drug:drug),
                      SizedBox(height: kDefaultPaddin / 2),
                    ],
                  ),
                    )
                    ),
                    DrugTitleWithImage(drug:drug),
              ],
            ),
          )
        ],
      ),
    );
  }
}
