import 'package:flutter/material.dart';
import 'package:pharmap/components/map.dart';
import 'package:pharmap/components/pharmacy_list.dart';
import 'package:pharmap/models/pharmacy.dart';
import 'package:pharmap/screens/search/search_screen.dart';

// ignore: must_be_immutable
class ResultScreen extends StatefulWidget {
  List<Pharmacy> pharmacies;
  String drugId;
  ResultScreen({this.pharmacies, this.drugId});
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
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
              pharmacies: widget.pharmacies,
              onTap: true,
              drugId: widget.drugId,
            ),
          ],
        ),
      ),
      // body: buildMap(),
    );
  }
}
