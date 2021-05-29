import 'package:flutter/material.dart';
import 'package:pharmap/components/custom_button.dart';
import 'package:pharmap/models/drug.dart';
import 'package:pharmap/models/pharmacy.dart';
import 'package:pharmap/models/pharmacy_type.dart';
import 'package:pharmap/screens/home/pay_screen.dart';
import 'package:pharmap/utils/constants.dart';

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
                (e) => Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 30.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: darkPrimaryColor,
                        offset: Offset(2, 3),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            e.pharmacyName,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            e.pharmacyType == PharmacyType.day
                                ? 'day'
                                : 'night',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(fontSize: 10, color: kTextColor),
                          ),
                          onTap
                              ? CustomButton(
                                  text: pharmacies.isEmpty
                                      ? "order now"
                                      : "pay now",
                                  press: pharmacies.isEmpty
                                      ? () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => PayScreen(
                                                drug: drugs
                                                    .where((element) =>
                                                        element.drugId ==
                                                        this.drugId)
                                                    .first,
                                              ),
                                            ),
                                          )
                                      : () {}, //! empty function -- to replace with order now logic
                                )
                              : SizedBox(height: 0.0),
                        ],
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
