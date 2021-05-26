import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pharmap/models/pharmacy.dart';

// ignore: must_be_immutable
class CustomMap extends StatefulWidget {
  List<Pharmacy> pharmacies;
  CustomMap({this.pharmacies});
  _CustomMapState createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  Completer<GoogleMapController> controller;
  static LatLng _initialPosition;
  static LatLng _lastMapPosition = _initialPosition;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
    if (_lastMapPosition != null) {
      widget.pharmacies.sort((pharA, pharB) => _getDistance(
              pharA.pharmacyLatitude, pharA.pharmacyLongitude)
          .compareTo(
              _getDistance(pharA.pharmacyLatitude, pharA.pharmacyLongitude)));
    }
  }

  double _getDistance(double lat, double long) {
    return sqrt(pow(_lastMapPosition.longitude - long, 2) +
        pow(_lastMapPosition.latitude - lat, 2));
  }

  Set<Marker> _createMarker() {
    int index = 0;
    if (widget.pharmacies == null) return {};
    return widget.pharmacies.map((pharmacy) {
      return Marker(
        markerId: MarkerId("marker ${index++}"),
        position: LatLng(pharmacy.pharmacyLatitude, pharmacy.pharmacyLongitude),
        infoWindow: InfoWindow(title: "marker ${index++}"),
      );
    }).toSet();
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

  @override
  Widget build(BuildContext context) {
    if (_initialPosition == null)
      return Center(
        child: Text("Loading..."),
      );

    return GoogleMap(
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
    );
  }
}
