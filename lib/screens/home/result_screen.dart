import 'package:flutter/material.dart';
import 'package:pharmap/components/map.dart';
import 'package:pharmap/components/pharmacy_list.dart';
import 'package:pharmap/models/drug.dart';
import 'package:pharmap/models/pharmacy.dart';
import 'package:pharmap/screens/search/search_screen.dart';
import 'package:pharmap/services/database.dart';

// ignore: must_be_immutable
class ResultScreen extends StatefulWidget {
  String drugId;
  ResultScreen({this.drugId});
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  List<Pharmacy> pharmaciesList;
  List<Drug> drugsList;
  Database db = Database();

  @override
  void initState() {
    super.initState();
    db
        .getPharmaciesList()
        .then((value) => setState(() => pharmaciesList = value));
    db.getDrugs().then((value) => setState(() => drugsList = value));
  }

  Widget buildMap() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: CustomMap(pharmacies: pharmaciesList),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            buildMap(),
            SearchScreen(),
            PharmacyListWidget(
              pharmacies: pharmaciesList != null ? pharmaciesList : [],
              drugExist: pharmaciesList != null &&
                  pharmaciesList
                          .where((element) =>
                              element.pharmacyDrugs.contains(widget.drugId))
                          .toList() != [],
              onTap: true,
              drugId: widget.drugId,
              drugs: drugsList != null ? drugsList : [],
            ),
          ],
        ),
      ),
      // body: buildMap(),
    );
  }
}
