import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static MaterialColor createMaterialColor(Color color) {
    List<double> strengths = <double>[.05];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });

    return MaterialColor(color.value, swatch);
  }

  static ThemeData lightTeme = ThemeData(
    primarySwatch: createMaterialColor(Color(0x23AA49)),
    primaryColor: createMaterialColor(Color(0x23AA49)),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: createMaterialColor(Color(0xCCCCCC)),
    // appBarTheme: const AppBarTheme(
    //   color: Colors.blue,
    //   elevation: 0,
    //   centerTitle: true,
    //   iconTheme: IconThemeData(color: Colors.white),
    // ),
    primaryTextTheme: TextTheme(
      headlineMedium: TextStyle(color: createMaterialColor(Color(0x06161C))),
      headlineSmall: TextStyle(color: createMaterialColor(Color(0x06161C))),
      bodySmall: TextStyle(color: createMaterialColor(Color(0x979899))),
      labelSmall: TextStyle(color: createMaterialColor(Color(0x06161C))),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: createMaterialColor(Color(0x23AA49)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: createMaterialColor(Color(0x23AA49)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
      ),
    ),
    // textButtonTheme: TextButtonThemeData(
    //   style: TextButton.styleFrom(
    //     foregroundColor: Colors.blue,
    //   ),
    // ),
    // floatingActionButtonTheme: const FloatingActionButtonThemeData(
    //   backgroundColor: Colors.blue,
    //   foregroundColor: Colors.white,
    // ),
    // inputDecorationTheme: InputDecorationTheme(
    //   border: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(10.0),
    //     borderSide: const BorderSide(color: Colors.blue),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(10.0),
    //     borderSide: const BorderSide(color: Colors.blue, width: 2.0),
    //   ),
    //   contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    // ),
    fontFamily: GoogleFonts.dmSans().fontFamily,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF09B180),
    errorColor: const Color(0xFFD1432A),
    iconTheme: IconThemeData(color: Colors.white),
  );
}
