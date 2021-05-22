import 'package:flutter/material.dart';
import 'package:pharmap/services/auth.dart';
import 'package:pharmap/utils/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:pharmap/utils/ExploreAppBar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ExploreScreen extends StatefulWidget {
  static final String id = '/ExloreScreen';
  _ExploreScreenState createState() => _ExploreScreenState();
  const ExploreScreen({Key key}) : super(key: key);
}

class _ExploreScreenState extends State<ExploreScreen> {
  AuthService auth = AuthService();
  static final LatLng _kMapCenter = LatLng(35.769751, 10.812024);

  static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);

  Set<Marker> _createMarker() {
    return {
      Marker(
        markerId: MarkerId("pharmacy1"),
        position: LatLng(35.765910, 10.833559),
        infoWindow: InfoWindow(title: 'pharmacy hmida'),
      ),
      Marker(
        markerId: MarkerId("pharmacy2"),
        position: LatLng(35.772653, 10.825710),
        infoWindow: InfoWindow(title: 'pharmacy hergli adel'),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        Expanded(
          flex: 1,
          child: Container(
            color: bgColor,
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
                children: [ExploreAppBar(height: 50)]),
          ),
        ),
        Expanded(
          flex: 8,
          child: GoogleMap(
            initialCameraPosition: _kInitialPosition,
            mapType: MapType.normal,
            markers: _createMarker(),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 150.0,
              child:
                  ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                SizedBox(width: 10.0),
                Padding(padding: const EdgeInsets.all(8.0)),
              ]),
            ),
          ),
        ),
      ])),
    );
  }
}
