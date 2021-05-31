import 'package:flutter/material.dart';
import 'package:pharmap/models/drug.dart';
import 'package:pharmap/utils/constants.dart';


class DrugTitleWithImage extends StatelessWidget {
  const DrugTitleWithImage({
    Key key,
    @required this.drug,
  }) : super(key: key);

  final Drug drug;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
         
          SizedBox(height: kDefaultPaddin),
          Row(
            children: <Widget>[
              SizedBox(width: kDefaultPaddin),
              Expanded(
                child: Hero(
                  tag: "${drug.drugId}",
                  child: Image.network(
                    drug.drugImage,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}