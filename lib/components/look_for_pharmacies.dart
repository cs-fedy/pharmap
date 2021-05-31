import 'package:flutter/material.dart';
import 'package:pharmap/components/custom_button.dart';
import 'package:pharmap/models/drug.dart';
import 'package:pharmap/screens/home/result_screen.dart';
import 'package:pharmap/utils/constants.dart';

class LookForPharmacies extends StatelessWidget {
  LookForPharmacies({
    Key key,
    @required this.drug,
  }) : super(key: key);

  final Drug drug;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: CustomButton(
        text: 'look for pharmacies',
        bgColor: primaryColor,
        press: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              drugId: drug.drugId
            ),
          ),
        ),
      ),
    );
  }
}
