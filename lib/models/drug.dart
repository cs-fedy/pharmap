

class Drug {
   String image, name, description, category, quantity;
   int price, id;

  Drug({
    this.id,
    this.image,
    this.name,
    this.price,
    this.description,
    this.category,
  
    this.quantity,


  });
}

List<Drug> drugs = [
  Drug(
      id: 1,
      name: "panadol extra",
      quantity: "500mg",
      price: 3270,
      description:" Panadol Extra est utilisé pour le traitement à court terme des maux de tête dintensité légère à modérée,Panadol Extra contient comme principe actif analgésique du paracétamol,ainsi que de la caféine.",
      image: "assets/images/panadolextra.png",
      category:'Paracétamol',
      
      
      ),
  Drug(
      id: 2,
      name: "ASPEGIC NOURRISSONS",
      quantity: "100 mg",
      price: 5,
      description:"Panadol Extra contient comme principe actif analgésique du paracétamol,ainsi que de la caféine. Panadol Extra est utilisé pour le traitement à court terme des maux de tête dintensité légère à modérée.",
      image: "assets/images/panadolextra.png",
     
      ),

  Drug(
      id: 2,
      name: "clamoxil",
      quantity: "250mg/5ml",
      price: 5,
      description:"Panadol Extra contient comme principe actif analgésique du paracétamol,ainsi que de la caféine. Panadol Extra est utilisé pour le traitement à court terme des maux de tête dintensité légère à modérée.",
      image: "assets/images/panadolextra.png",
     
      )

      
  
 
];
