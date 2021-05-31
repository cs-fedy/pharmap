import 'package:flutter/material.dart';
import 'package:pharmap/components/custom_button.dart';
import 'package:pharmap/services/auth.dart';
import 'package:pharmap/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  static final String id = '/HomeScreen';
  final AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(30, 50, 30, 50),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              SizedBox(
                child: Image.network(pharmacyimg, ),
              ),
              SizedBox(
                child: Text(
                  'click here to see the document',
                  style: TextStyle(color: kTextColor, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 15,
              )
            ],
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }
}
