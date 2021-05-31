import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pharmap/models/article.dart';
import 'package:pharmap/models/drug.dart';
import 'package:pharmap/models/notification.dart';
import 'package:pharmap/models/pharmacy.dart';
import 'package:pharmap/models/pharmacy_type.dart';

class Database {
  final CollectionReference _clientsDataCollection =
      FirebaseFirestore.instance.collection("clients");
  final CollectionReference _pharmacyDataCollection =
      FirebaseFirestore.instance.collection("pharmacy");
  final CollectionReference _drugsDataCollection =
      FirebaseFirestore.instance.collection("drugs");
  final CollectionReference _reccentDrugsDataCollection =
      FirebaseFirestore.instance.collection("recent");
  final CollectionReference _notifDataCollection =
      FirebaseFirestore.instance.collection("notif");
  final CollectionReference _articleDataCollection =
      FirebaseFirestore.instance.collection("articles");
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

  Future addDrugToRecentList(String drugId) async {
    return await _reccentDrugsDataCollection.doc(drugId).set({});
  }

  Future<List<Drug>> getRecentDrugs() async {
    QuerySnapshot recent = await _reccentDrugsDataCollection.get();
    List<QueryDocumentSnapshot> recentList = recent.docs;
    List<Drug> drugs = [];
    for (QueryDocumentSnapshot element in recentList) {
      Future<DocumentSnapshot> drugFuture =
          _drugsDataCollection.doc(element.id).get();
      drugFuture.then(
        (value) => drugs.add(
          Drug(
            drugCategory: value.data()["drugCategory"],
            drugDescription: value.data()["drugDescription"],
            drugId: value.id,
            drugImage: value.data()["drugImage"],
            drugName: value.data()["drugName"],
            drugPrice: value.data()["drugPrice"] / 1.0,
            drugQuantity: value.data()["drugQuantity"],
            drugType: value.data()["drugType"],
          ),
        ),
      );
    }
    return drugs;
  }

  Future<List<Pharmacy>> getPharmaciesList() async {
    QuerySnapshot pharmacies = await _pharmacyDataCollection.get();
    List<QueryDocumentSnapshot> list = pharmacies.docs;
    return list
        .map(
          (element) => Pharmacy(
            pharmacyName: element.data()["pharmacyName"],
            pharmacyOwnerId: element.data()["pharmacyOwner"],
            pharmacyLatitude: element.data()["pharmacyLatitude"] / 1.0,
            pharmacyLongitude: element.data()["pharmacyLongitude"] / 1.0,
            pharmacyType: element.data()["pharmacyType"] == "night"
                ? PharmacyType.night
                : PharmacyType.day,
            pharmacyDrugs: element.data()["pharmacyDrugs"],
          ),
        )
        .toList();
  }

  Future<List<Drug>> getDrugs() async {
    QuerySnapshot drugs = await _drugsDataCollection.get();
    List<QueryDocumentSnapshot> list = drugs.docs;
    return list
        .map(
          (drug) => Drug(
            drugCategory: drug.data()['drugCategory'],
            drugDescription: drug.data()["drugDescription"],
            drugId: drug.id,
            drugImage: drug.data()["drugImage"],
            drugName: drug.data()["drugName"],
            drugPrice: drug.data()["drugPrice"] / 1.0,
            drugQuantity: drug.data()["drugQuantity"],
            drugType: drug.data()["drugType"],
          ),
        )
        .toList();
  }

  Future<void> pushNotif(String title, String body) async {
    await _notifDataCollection.add({"title": title, "body": body});
  }

  Future<List<Notif>> getNotifications() async {
    QuerySnapshot notifs = await _notifDataCollection.get();
    List<QueryDocumentSnapshot> list = notifs.docs;
    return list
        .map(
          (notif) => Notif(
            title: notif.data()['title'],
            body: notif.data()["body"],
          ),
        )
        .toList();
  }

  Future<List<Article>> getArticles() async {
    QuerySnapshot articles = await _articleDataCollection.get();
    List<QueryDocumentSnapshot> list = articles.docs;
    return list
        .map(
          (article) => Article(
            url: article.data()['url'],
            image: article.data()["image"],
            title: article.data()["title"],
            body: article.data()["body"],
          ),
        )
        .toList();
  }

  Future<Drug> getDrugById(String drugId) {
    return _drugsDataCollection.doc(drugId).get().then(
          (value) => Drug(
            drugCategory: value['drugCategory'],
            drugDescription: value["drugDescription"],
            drugId: drugId,
            drugImage: value["drugImage"],
            drugName: value["drugName"],
            drugPrice: value["drugPrice"] / 1.0,
            drugQuantity: value["drugQuantity"],
            drugType: value["drugType"],
          ),
        );
  }
}
