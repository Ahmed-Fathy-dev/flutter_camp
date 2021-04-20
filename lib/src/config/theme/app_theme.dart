import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlutterCampTheme {
  static ThemeData of(context) {
    var theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: Colors.teal[400],
      accentColor: Colors.cyan[400],
      scaffoldBackgroundColor: Colors.cyan[50],
      indicatorColor: Colors.cyan[200],
      //canvasColor: Color.fromRGBO(255, 224, 181, 1),
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: ThemeData.light().iconTheme.copyWith(color: Colors.black87),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: GoogleFonts.cairo(
                color: Colors.black87,
                textStyle: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
      ),
      textTheme: ThemeData.light().textTheme.copyWith(
            headline2: GoogleFonts.concertOne(
              textStyle: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            headline3: GoogleFonts.cairo(
              textStyle: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            button: GoogleFonts.scheherazade(
              textStyle: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            subtitle1: GoogleFonts.concertOne(
              textStyle: const TextStyle(
                fontSize: 25,
                color: Colors.black87,
              ),
            ),
            subtitle2: GoogleFonts.cairo(
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
          ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
