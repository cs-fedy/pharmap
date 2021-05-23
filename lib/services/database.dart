import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final CollectionReference _clientsDataCollection =
      FirebaseFirestore.instance.collection("clients");
  final CollectionReference _pharmacyDataCollection =
      FirebaseFirestore.instance.collection("pharmacy");
        final CollectionReference _drugsDataCollection =
      FirebaseFirestore.instance.collection("drugs");
      

  Future addUserInfo(String uid, String fullName, int phoneNumber) async {
    return await _clientsDataCollection.doc(uid).set({
      'fullName': fullName,
      'phoneNumber': phoneNumber,
    });
  }

  Future addPharmacyData(
      String uid,
      String pharmacyCode,
      String pharmacyName,
      double pharmacyLongitude,
      double pharmacyLatitude,
      String pharmacyType) async {
    return await _pharmacyDataCollection.doc(pharmacyCode).set({
      'pharmacyOwner': uid,
      'pharmacyName': pharmacyName,
      'pharmacyLongitude': pharmacyLongitude,
      'pharmacyLatitude': pharmacyLatitude,
      'pharmacyType': pharmacyType
    });
  }

  Future getFilteredDrugs(String query) async {
    QuerySnapshot drugs = await _drugsDataCollection.get();
    List<QueryDocumentSnapshot> drugsList = drugs.docs;
    return drugsList.where((drug) => drug["searchKeys"].contains(query));
  }

  Future addDrugToRecentList(QueryDocumentSnapshot drug) async {
    return await _drugsDataCollection.doc(drug.id).set({});
  }
}
