import 'package:flutter/material.dart';
import 'package:pharmap/components/map.dart';
import 'package:pharmap/components/pharmacy_list.dart';
import 'package:pharmap/models/drug.dart';
import 'package:pharmap/models/pharmacy.dart';
import 'package:pharmap/screens/search/search_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:pharmap/services/database.dart';
import 'package:pharmap/utils/ExploreAppBar.dart';

class ExploreScreen extends StatefulWidget {
  static final String id = '/ExloreScreen';
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<Pharmacy> pharmaciesList;
  List<Drug> drugsList;
  Database db = Database();

  @override
  void initState() {
    super.initState();
    db.getPharmaciesList().then((value) => setState(() => pharmaciesList = value));
    db.getDrugs().then((value) => setState(() => drugsList = value));
  }
  // Widget buildCats() {
  //   return Align(
  //     alignment: Alignment.topLeft,
  //     child: Container(
  //       padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
  //       child: ExploreAppBar(),
  //     ),
  //   );
  // }

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
          children: [
            buildMap(),
            SearchScreen(),
            // buildCats(),
            PharmacyListWidget(
              onTap: false,
              pharmacies: pharmaciesList != null ? pharmaciesList : [],
              drugs: drugsList != null ? drugsList: [],
            ),
          ],
        ),
      ),
      // body: buildMap(),
    );
  }
}
