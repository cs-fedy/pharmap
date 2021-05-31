import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:pharmap/components/drugcard.dart';
import 'package:pharmap/models/drug.dart';
import 'package:pharmap/services/database.dart';

class SearchScreen extends StatefulWidget {
  static final String id = '/SearchScreen';
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Drug> drugsList;
  Database db = Database();
  
  void _getDrugs() {
    db.getRecentDrugs().then((value) => setState(() => drugsList = value));
  }
  
  @override
  void initState() {
    super.initState();
    _getDrugs();
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Align(
      alignment: Alignment.topLeft,
      child: FloatingSearchBar(
        hint: 'Search...',
        scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
        transitionDuration: const Duration(milliseconds: 800),
        transitionCurve: Curves.easeInOut,
        physics: const BouncingScrollPhysics(),
        axisAlignment: isPortrait ? 0.0 : -1.0,
        openAxisAlignment: 0.0,
        width: isPortrait ? 600 : 500,
        debounceDelay: const Duration(milliseconds: 500),
        onQueryChanged: (query) {
          db.getFilteredDrugs(query).then((value) => setState(() => drugsList = value));
        },
        // Specify a custom transition to be used for
        // animating between opened and closed stated.
        transition: CircularFloatingSearchBarTransition(),
        actions: [
          FloatingSearchBarAction.searchToClear(
            showIfClosed: false,
          ),
        ],
        builder: (context, transition) {
          return 
          
             Column(
                mainAxisSize: MainAxisSize.min,
                children: drugsList == null? []: drugsList.map((e) => DrugCard(drug: e)).toList(),
              );
            
          
        },
      ),
    );
  }
}
