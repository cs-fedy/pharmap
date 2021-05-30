import 'package:flutter/material.dart';
import 'package:pharmap/models/drug.dart';
import 'package:pharmap/screens/search/about_drug_screen.dart';
import 'package:pharmap/utils/constants.dart';

class DrugCard extends StatelessWidget {
  const DrugCard({
    Key key,
    @required this.drug,
  }) : super(key: key);

  final Drug drug;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AboutDrugScreen(
            drug: drug,
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        margin: EdgeInsets.only(bottom: 15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color:darkPrimaryColor,
              offset: Offset(2, 3),
              blurRadius: 10,
            ),
          ],
        ),

        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(drug.drugImage),
            ),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    drug.drugName,
                    style: Theme.of(context)
                .textTheme
                .headline4.copyWith(color:dangerColor,fontSize: 20)

                    ),
                  
                 SizedBox(height: 10),
                  Text(
                    drug.drugQuantity,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize:10)
                  ),
                 SizedBox(height: 5),

                  Text(
                    drug.drugCategory,
                   style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize:10)
                  ), 
                  ],
              ),
            ),
                  SizedBox(height: 15),
              Expanded(
               flex: 2,

                child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        drug.drugPrice.toString(),
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 20,
                        ),
                      ),
                      
                      Text(
                        'DT',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
