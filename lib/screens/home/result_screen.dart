import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pharmap/models/pharmacy.dart';
import 'package:pharmap/models/pharmacy_type.dart';
import 'package:pharmap/screens/home/pay_screen.dart';

// ignore: must_be_immutable
class ResultScreen extends StatefulWidget {
  //! to change later -- testing purpose
  String drugId = "b2a5378a-644b-4fdd-95d4-ecf1f2ba9037";
  // ResultScreen({ this.drugId });
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Completer<GoogleMapController> controller;
  static LatLng _initialPosition;
  static LatLng _lastMapPosition = _initialPosition;
  List<Pharmacy> pharmacies;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
    _getPharmaciesList();
  }

  void _getPharmaciesList() {
    List<Pharmacy> filteredPharmacies = pharmaciesList
        .where((pharmacy) => pharmacy.pharmacyDrugs.indexOf(widget.drugId) > 0)
        .toList();
    if (_lastMapPosition != null) {
      filteredPharmacies.sort((pharA, pharB) => _getDistance(
              pharA.pharmacyLatitude, pharA.pharmacyLongitude)
          .compareTo(
              _getDistance(pharA.pharmacyLatitude, pharA.pharmacyLongitude)));
    }
    setState(() {
      pharmacies = filteredPharmacies;
    });
  }

  double _getDistance(double lat, double long) {
    return sqrt(pow(_lastMapPosition.longitude - long, 2) +
        pow(_lastMapPosition.latitude - lat, 2));
  }

  Future _getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(
        () => _initialPosition = LatLng(position.latitude, position.longitude));
  }

  _onMapCreated(GoogleMapController controller) {
    setState(() {
      this.controller.complete(controller);
    });
  }

  MapType _currentMapType = MapType.normal;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  Set<Marker> _createMarker() {
    int index = 0;
    return pharmacies.map((pharmacy) {
      return Marker(
        markerId: MarkerId("marker ${index++}"),
        position: LatLng(pharmacy.pharmacyLatitude, pharmacy.pharmacyLongitude),
        infoWindow: InfoWindow(title: "marker ${index++}"),
      );
    }).toSet();
  }

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
              flex: 9,
              child: _initialPosition == null
                  ? Center(child: Text("Loading..."))
                  : Stack(
                      children: [
                        GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target: _initialPosition,
                            zoom: 11.0,
                            tilt: 0,
                            bearing: 0,
                          ),
                          onMapCreated: _onMapCreated,
                          zoomGesturesEnabled: true,
                          onCameraMove: _onCameraMove,
                          myLocationEnabled: true,
                          compassEnabled: true,
                          myLocationButtonEnabled: false,
                          markers: _createMarker(),
                        ),
                        SingleChildScrollView(
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
                                      decoration:
                                          BoxDecoration(color: Colors.white),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 100,
                                            child: Image.network(
                                                e.pharmacyPictureUrl),
                                          ),
                                          SizedBox(width: 10.0),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                e.pharmacyName,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .button,
                                              ),
                                              Text(
                                                  "pharmacy owner: ${e.pharmacyOwnerName}"),
                                              Text(
                                                  "pharmacy type: ${e.pharmacyType == PharmacyType.day ? 'day' : 'night'}"),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      // Navigator.pushNamed(
                                      //   context,
                                      //   '/PayScreen',
                                      //   arguments: {e, widget.drugId},
                                      // );
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PayScreen(
                                            drugId: widget.drugId,
                                            pharmacy: e,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                                .toList(),
                          ),
                        )
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
