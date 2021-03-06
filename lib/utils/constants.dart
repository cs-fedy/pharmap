import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//* Colors codes:
final Color primaryColor = Color(0xFF2A9D8F);
final Color darkPrimaryColor = Color(0xFF264653);
final Color secondaryColor = Color(0xFFE76f51);
final Color acsentColor = Color(0xFFF4A261);
final Color lightColor = Color(0xFFE9C46A);
final Color bgColor = Color(0xFFF1FAEE);
final Color dangerColor = Color(0xFFE63946);
const kTextColor = Color(0xFF535353);
const kTextLightColor = Color(0xFFACACAC);
const kDefaultPaddin = 20.0;
//* Text custom theme:
final TextTheme textTheme = TextTheme(
  headline1: GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.bold,
      color: primaryColor,
      letterSpacing: 3,
    ),
  ),
  headline2: GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: secondaryColor,
      letterSpacing: 2,
    ),
  ),
  bodyText1: GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: darkPrimaryColor,
    ),
  ),
);

final TextStyle buttonTextStyle = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: bgColor,
  ),
);

const String pharmacyimg =
    'https://cdn.sanity.io/images/0vv8moc6/drugtopics/cdcd72c4059bf900e42c2ff60a2d33a571fe7c86-1000x667.png?fit=crop&auto=format';
