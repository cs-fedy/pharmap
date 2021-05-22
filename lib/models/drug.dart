class Drug {
  String drugId;
  String drugImage;
  String drugName;
  String drugDescription;
  String drugCategory;
  String drugType;
  String drugQuantity;
  double drugPrice;

  Drug({
    this.drugId,
    this.drugDescription,
    this.drugCategory,
    this.drugImage,
    this.drugName,
    this.drugPrice,
    this.drugQuantity,
    this.drugType,
  });
}

List<Drug> drugs = [
  Drug(
    drugId: "a4bf471a-a1c9-4904-8085-975dd953aa23",
    drugName: "panadol",
    drugQuantity: "500mg",
    drugPrice: 3270,
    drugDescription:
        "Panadol Extra contient comme principe actif analgésique du paracétamol,ainsi que de la caféine. Panadol Extra est utilisé pour le traitement à court terme des maux de tête dintensité légère à modérée.",
    drugImage: "assets/images/panadolextra.png",
    drugCategory: 'Paracétamol',
    drugType: "pills",
  ),
  Drug(
    drugId: "2b95cbb1-a463-4c7d-9ab2-b52a6a95b606",
    drugName: "ASPEGIC NOURRISSONS",
    drugQuantity: "100 mg",
    drugPrice: 5,
    drugDescription:
        "Panadol Extra contient comme principe actif analgésique du paracétamol,ainsi que de la caféine. Panadol Extra est utilisé pour le traitement à court terme des maux de tête dintensité légère à modérée.",
    drugImage: "assets/images/panadolextra.png",
    drugCategory: "Paracétamol",
    drugType: "powder for oral solution",
  ),
  Drug(
    drugId: "b2a5378a-644b-4fdd-95d4-ecf1f2ba9037",
    drugName: "clamoxil",
    drugQuantity: "250mg/5ml",
    drugPrice: 5,
    drugDescription:
        "Panadol Extra contient comme principe actif analgésique du paracétamol,ainsi que de la caféine. Panadol Extra est utilisé pour le traitement à court terme des maux de tête dintensité légère à modérée.",
    drugImage: "assets/images/panadolextra.png",
    drugType: "serop",
  )
];
