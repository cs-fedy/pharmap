import 'package:flutter/material.dart';
import 'package:pharmap/models/drug.dart';
import 'package:pharmap/utils/constants.dart';

class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.drug,
  }) : super(key: key);

  final Drug drug;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            drug.drugName,
            style: Theme.of(context).textTheme.headline4.copyWith(
                  color: Color(0xff21DAA2),
                ),
          ),
          SizedBox(height: kDefaultPaddin / 2),
          Text(
            drug.drugCategory,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: kDefaultPaddin / 2),
          Text(
            drug.drugQuantity,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: kDefaultPaddin / 2),
          Text(
            drug.drugDescription,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
