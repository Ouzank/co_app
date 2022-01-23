import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kPrimaryColor = Color(0xFF151f28);

const kMainAccentColor = Colors.red;
const kColor2 = Color(0xFFFAAA8D);
const kColor3 = Color(0xFFfeefdd); //2E4AB5
const kColor4 = Color(0xFFFEEFDD);
const kColor5 = Color(0xFF50B2C0);
const kColor6 = Color(0xFFffec4e);

class MyTheme {
  final lightTheme = ThemeData.light().copyWith(
    textTheme: GoogleFonts.overlockTextTheme().apply(
      bodyColor: kPrimaryColor,
    ),
    primaryColor: kMainAccentColor,
    appBarTheme: const AppBarTheme(backgroundColor: kPrimaryColor),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      },
    ),
  );
  final darkTheme = ThemeData(
    scaffoldBackgroundColor: kPrimaryColor,
    primarySwatch: kMainAccentColor,
    brightness: Brightness.dark,
    primaryColor: kMainAccentColor,
    appBarTheme: const AppBarTheme(backgroundColor: kPrimaryColor),
    textTheme: GoogleFonts.overlockTextTheme().apply(
      bodyColor: Colors.white,
    ),
    primaryColorDark: kMainAccentColor,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      },
    ),
  );
}
