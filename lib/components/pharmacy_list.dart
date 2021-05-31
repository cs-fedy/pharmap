import 'package:flutter/material.dart';
import 'package:pharmap/components/custom_button.dart';
import 'package:pharmap/models/drug.dart';
import 'package:pharmap/models/pharmacy.dart';
import 'package:pharmap/models/pharmacy_type.dart';
import 'package:pharmap/screens/home/pay_screen.dart';
import 'package:pharmap/screens/home/success_screen.dart';
import 'package:pharmap/services/database.dart';
import 'package:pharmap/utils/constants.dart';

// ignore: must_be_immutable
class PharmacyListWidget extends StatelessWidget {
  List<Pharmacy> pharmacies;
  bool onTap = false;
  String drugId;
  List<Drug> drugs;
  bool drugExist;
  Database db = Database();
  PharmacyListWidget(
      {this.pharmacies,
      this.onTap,
      this.drugId,
      this.drugs,
      this.drugExist = false});
  void _orderNow(BuildContext context) {
    db.pushNotif("").then((value) => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                SuccessScreen(text: "order requested successfully"),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    if (pharmacies == []) return Center(child: Text("Loading.."));
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
                          SizedBox(height: 10.0),
                          ShowButton(
                            isResultScreen: onTap,
                            onTap: drugExist
                                ? () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PayScreen(
                                          drug: drugs
                                              .where((element) =>
                                                  element.drugId == this.drugId)
                                              .first,
                                        ),
                                      ),
                                    )
                                : () => _orderNow(context),
                            text: drugExist ?  "pay now": "order now",
                          ),
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

// ignore: must_be_immutable
class ShowButton extends StatelessWidget {
  bool isResultScreen = true;
  Function onTap;
  String text;
  ShowButton({this.isResultScreen, this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    if (isResultScreen) {
      return CustomButton(
        width: 200.0,
        bgColor: dangerColor,
        text: text,
        press: onTap,
      );
    }

    return SizedBox(height: 0.0);
  }
}
