import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pharmap/components/custom_button.dart';
import 'package:pharmap/utils/constants.dart';

class ExploreScreen extends StatelessWidget {
  static final LatLng _kMapCenter =
      LatLng(19.018255973653343, 72.84793849278007);

  static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: bgColor,
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      text: "Open",
                      press: () {},
                      bgColor: primaryColor,
                      width: 100,
                    ),
                    CustomButton(
                      text: "Price",
                      press: () {},
                      bgColor: primaryColor,
                      width: 100,
                    ),
                    CustomButton(
                      text: "Time",
                      press: () {},
                      bgColor: primaryColor,
                      width: 100,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: GoogleMap(initialCameraPosition: _kInitialPosition),
            ),
          ],
        ),
      ),
    );
  }
}
