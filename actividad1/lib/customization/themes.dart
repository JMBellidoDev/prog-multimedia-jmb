import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Tema claro
final customizedLightTheme = ThemeData(

  // Básica
  brightness: Brightness.light,
  primaryColor: Colors.white70,
  dividerColor: Colors.black54,

  // Scaffold + AppBar
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blue.shade400,
    foregroundColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.white)
  ),

  // ElevatedButton
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white
    )
  ),

  // FloatingActionButton
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.white
  ),

  // Textos
  textTheme: TextTheme(

    // Títulos
    titleLarge: GoogleFonts.rubik(
      color: Colors.black,
      fontSize: 35,
      backgroundColor: const Color.fromARGB(80, 254, 247, 255)
    ),
    titleSmall: GoogleFonts.rubik(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black
    ),

    headlineLarge: GoogleFonts.rubik(
      fontSize: 26,
      color: Colors.white,
    ),
    headlineSmall: GoogleFonts.rubik(
      fontSize: 20,
      color: Colors.white,
    ),

    // Texto del cuerpo
    labelLarge: GoogleFonts.rubik(fontWeight: FontWeight.bold, fontSize: 18),
    labelMedium: GoogleFonts.rubik(fontWeight: FontWeight.bold, fontSize: 14),
    labelSmall: GoogleFonts.rubik(fontWeight: FontWeight.w500, fontSize: 13),
    bodyMedium: GoogleFonts.rubik()

  ),

  iconTheme: const IconThemeData(
    color: Colors.black
  ),
);

