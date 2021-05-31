import 'package:pharmap/models/pharmacy_type.dart';

class Pharmacy {
  String pharmacyName;
  String pharmacyOwnerId;
  String pharmacyOwnerName;
  String pharmacyPictureUrl;
  double pharmacyLatitude;
  double pharmacyLongitude;
  PharmacyType pharmacyType;
  List<dynamic> pharmacyDrugs;
  Pharmacy({
    this.pharmacyName,
    this.pharmacyOwnerId,
    this.pharmacyLatitude,
    this.pharmacyLongitude,
    this.pharmacyType,
    this.pharmacyDrugs,
  });
}