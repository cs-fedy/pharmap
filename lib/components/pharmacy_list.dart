import 'package:flutter/material.dart';
import 'package:pharmap/models/pharmacy.dart';
import 'package:pharmap/models/pharmacy_type.dart';
import 'package:pharmap/screens/home/pay_screen.dart';

// ignore: must_be_immutable
class PharmacyListWidget extends StatelessWidget {
  List<Pharmacy> pharmacies;
  bool onTap = false;
  String drugId;
  PharmacyListWidget({this.pharmacies, this.onTap, this.drugId});

  @override
  Widget build(BuildContext context) {
    if (pharmacies == null) return Center(child: Text("Loading.."));
    return Align(
      alignment: Alignment.bottomLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: pharmacies
              .map(
                (e) => InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 30.0,
                    ),
                    margin: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          child: Image.network(e.pharmacyPictureUrl),
                        ),
                        SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              e.pharmacyName,
                              style: Theme.of(context).textTheme.button,
                            ),
                            Text("pharmacy owner: ${e.pharmacyOwnerName}"),
                            Text(
                                "pharmacy type: ${e.pharmacyType == PharmacyType.day ? 'day' : 'night'}"),
                          ],
                        )
                      ],
                    ),
                  ),
                  onTap: onTap
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PayScreen(
                                drugId: drugId,
                                pharmacy: e,
                              ),
                            ),
                          );
                        }
                      : () {},
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
