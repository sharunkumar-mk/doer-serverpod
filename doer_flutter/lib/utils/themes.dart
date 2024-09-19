import 'package:doer_flutter/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  final lightTheme = ThemeData(
      useMaterial3: false,
      // textTheme: GoogleFonts.poppinsTextTheme(Typography.blackCupertino),

      // appBarTheme:
      //     const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
      // scaffoldBackgroundColor: Colors.transparent,
      brightness: Brightness.light,
      primaryColor: WebAppColors.primary);

  final darkTheme = ThemeData(
    // textTheme: GoogleFonts.poppinsTextTheme(Typography.whiteCupertino),
    useMaterial3: false,
    scaffoldBackgroundColor: Colors.black,
    drawerTheme: const DrawerThemeData(backgroundColor: Colors.black),

    // appBarTheme:
    //     const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
    // scaffoldBackgroundColor: Colors.transparent,
    brightness: Brightness.dark,
  );
}
