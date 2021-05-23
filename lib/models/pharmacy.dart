import 'package:pharmap/models/pharmacy_type.dart';

class Pharmacy {
  String pharmacyName;
  String pharmacyOwnerId;
  String pharmacyOwnerName;
  String pharmacyPictureUrl;
  double pharmacyLatitude;
  double pharmacyLongitude;
  PharmacyType pharmacyType;
  List<String> pharmacyDrugs;
  Pharmacy({
    this.pharmacyName,
    this.pharmacyOwnerId,
    this.pharmacyOwnerName,
    this.pharmacyPictureUrl,
    this.pharmacyLatitude,
    this.pharmacyLongitude,
    this.pharmacyType,
    this.pharmacyDrugs,
  });
}

List<Pharmacy> pharmaciesList = [
  Pharmacy(
    pharmacyName: "pharmacie rue hopital",
    pharmacyOwnerId: "2E2XOWfTbgS3JC488s9Pc7ab4X42",
    pharmacyOwnerName: "Fedi Abdouli",
    pharmacyPictureUrl:
        "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=z7v8al_aZWwefgtrcfpUmA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=178.9983&pitch=0&thumbfov=100",
    pharmacyLatitude: 35.7703003,
    pharmacyLongitude: 10.839228,
    pharmacyType: PharmacyType.day,
    pharmacyDrugs: [
      "a4bf471a-a1c9-4904-8085-975dd953aa23",
      "2b95cbb1-a463-4c7d-9ab2-b52a6a95b606",
    ],
  ),
  Pharmacy(
    pharmacyName: "Pharmacie Charnine",
    pharmacyOwnerId: "2E2XOWfTbgS3JC488s9Pc7ab4W42",
    pharmacyOwnerName: "Siwar Rezgui",
    pharmacyPictureUrl:
        "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=WXsrzli_zTYF9K7Y8oiAzA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=182.68533&pitch=0&thumbfov=100",
    pharmacyLatitude: 35.7726023,
    pharmacyLongitude: 10.8304146,
    pharmacyType: PharmacyType.night,
    pharmacyDrugs: [
      "a4bf471a-a1c9-4904-8085-975dd953aa23",
      "2b95cbb1-a463-4c7d-9ab2-b52a6a95b606",
      "b2a5378a-644b-4fdd-95d4-ecf1f2ba9037",
    ],
  ),
  Pharmacy(
    pharmacyName: "pharmacie de nuit",
    pharmacyOwnerId: "2E2XOWfTbgS3JC48XX9Pc7ab4X42",
    pharmacyOwnerName: "Eya Saied",
    pharmacyPictureUrl:
        "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=xrZTh763yS8J8wJUKar1cQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=226.37016&pitch=0&thumbfov=100",
    pharmacyLatitude: 35.7726023,
    pharmacyLongitude: 10.8240029,
    pharmacyType: PharmacyType.night,
    pharmacyDrugs: [
      "a4bf471a-a1c9-4904-8085-975dd953aa23",
      "b2a5378a-644b-4fdd-95d4-ecf1f2ba9037",
    ],
  ),
  Pharmacy(
    pharmacyName: "Médica Pro",
    pharmacyOwnerId: "2E2XOWfTbgS3JC4WWZZSS9Pc7ab4X42",
    pharmacyOwnerName: "Seif Ben Khemis",
    pharmacyPictureUrl:
        "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=2pTLSYLkQqMgXMjJsEQgQw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=227.16533&pitch=0&thumbfov=100",
    pharmacyLatitude: 35.7704318,
    pharmacyLongitude: 10.8240029,
    pharmacyType: PharmacyType.day,
    pharmacyDrugs: [
      "a4bf471a-a1c9-4904-8085-975dd953aa23",
      "2b95cbb1-a463-4c7d-9ab2-b52a6a95b606",
      "b2a5378a-644b-4fdd-95d4-ecf1f2ba9037",
    ],
  ),
  Pharmacy(
    pharmacyName: "Pharmacie Imene SOUSSI née Zili",
    pharmacyOwnerId: "2E2XOWfTbgS3JC488s9Pc7RRb4X42",
    pharmacyOwnerName: "Imene SOUSSI",
    pharmacyPictureUrl:
        "https://lh5.googleusercontent.com/p/AF1QipMeFUIpJCmalKKAlNZ4CkQReUxeqtLwTQUjOvmq=w408-h544-k-no",
    pharmacyLatitude: 35.7666801,
    pharmacyLongitude: 10.8277043,
    pharmacyType: PharmacyType.day,
    pharmacyDrugs: [
      "a4bf471a-a1c9-4904-8085-975dd953aa23",
    ],
  ),
  Pharmacy(
    pharmacyName: "Pharmacie RHIM AHMED",
    pharmacyOwnerId: "2E2XOWfTbgS3JC48ssdds9PddRRb4X42",
    pharmacyOwnerName: "RHIM AHMED",
    pharmacyPictureUrl:
        "https://lh5.googleusercontent.com/p/AF1QipO3zfzoTmm-cGsjdxStu0z-MEEzLzQ3andw9rOv=w408-h306-k-no",
    pharmacyLatitude: 35.7666801,
    pharmacyLongitude: 10.8277042,
    pharmacyType: PharmacyType.day,
    pharmacyDrugs: [],
  ),
];
