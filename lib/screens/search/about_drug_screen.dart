
import 'package:flutter/material.dart';
import 'package:pharmap/components/body.dart';
import 'package:pharmap/models/drug.dart';

class AboutDrugScreen extends StatelessWidget {
  final Drug drug;
  static final String id = '/AboutDrugScreen';
  AboutDrugScreen({Key key, this.drug}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      backgroundColor:Color(0xffCCF1C0),
      body: Body(drug: drug),
    );
  }
}