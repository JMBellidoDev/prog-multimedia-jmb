import 'package:flutter/material.dart';
import '../screens/screens.dart';

class AppRoutes {
  
  // Nombres de rutas
  static const String home = "/";
  static const String row = "/row";
  static const String column = "/column";
  static const String icons = "/icons";
  static const String pageImplementation = "/page";
  static const String rowsAndColumns = "/rowsandcolumns";
  static const String counter = "/counter";
  static const String instagram = "/instagram";
  static const String game = "/game";

  // Mapas de rutas
  static final Map<String, WidgetBuilder> routes = {
    home: (context) => const MainApp(),
    row: (context) => const RowApp(),
    column: (context) => const ColumnApp(),
    icons: (context) => const IconsApp(),
    pageImplementation: (context) => const PageImplementation(),
    rowsAndColumns: (context) => const RowsAndColumnsApp(),
    counter: (context) => const CounterApp(),
    instagram: (context) => const Instagram(),
    game: (context) => const GameApp()
  };

}