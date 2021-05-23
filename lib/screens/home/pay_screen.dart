import 'package:flutter/material.dart';
import 'package:pharmap/models/pharmacy.dart';

// ignore: must_be_immutable
class PayScreen extends StatefulWidget {
  static final String id = "/PayScreen";
  Pharmacy pharmacy;
  String drugId;
  PayScreen({this.pharmacy, this.drugId});
  @override
  _PayScreenState createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("pay screen"),
      ),
    );
  }
}
