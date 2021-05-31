import 'package:flutter/material.dart';
import 'package:pharmap/components/custom_button.dart';
import 'package:pharmap/components/drugcard.dart';
import 'package:pharmap/models/drug.dart';
import 'package:pharmap/screens/home/success_screen.dart';
import 'package:pharmap/utils/constants.dart';

// ignore: must_be_immutable
class PayScreen extends StatefulWidget {
  static final String id = "/PayScreen";
  Drug drug;
  PayScreen({this.drug});
  @override
  _PayScreenState createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  TextEditingController cardNumber = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController month = TextEditingController();
  TextEditingController cvc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget addThisCard = CustomButton(
      text: "order now",
      press: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              SuccessScreen(text: "order requested successfully"),
        ),
      ),
      bgColor: primaryColor,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: kToolbarHeight),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Fill the form to proceed the payement',
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(height: 10.0),
                DrugCard(drug: widget.drug),
                SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.all(16.0),
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.grey[200],
                        ),
                        child: TextField(
                          // inputFormatters: [
                          //   LengthLimitingTextInputFormatter(16)
                          // ],
                          controller: cardNumber,
                          onChanged: (val) {
                            setState(() {});
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Card Number'),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.only(left: 16.0),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Colors.grey[200],
                              ),
                              child: TextField(
                                // inputFormatters: [
                                //   LengthLimitingTextInputFormatter(2)
                                // ],
                                controller: month,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Month'),
                                onChanged: (val) {
                                  setState(() {});
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.only(left: 16.0),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Colors.grey[200],
                              ),
                              child: TextField(
                                // inputFormatters: [
                                //   LengthLimitingTextInputFormatter(2)
                                // ],
                                controller: year,
                                decoration: InputDecoration(
                                    border: InputBorder.none, hintText: 'Year'),
                                onChanged: (val) {
                                  setState(() {});
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.only(left: 16.0),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Colors.grey[200],
                              ),
                              child: TextField(
                                controller: cvc,
                                decoration: InputDecoration(
                                    border: InputBorder.none, hintText: 'CVC'),
                                onChanged: (val) {
                                  setState(() {});
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.grey[200],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Name on card'),
                          onChanged: (val) {
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Center(
                    child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: addThisCard,
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
