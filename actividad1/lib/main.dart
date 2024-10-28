import 'package:flutter/material.dart';
import 'screens/screens.dart';


void main() {
  runApp(
    MaterialApp(
      title: 'Actividad 1',
      initialRoute: '/',
      routes: {
        HOME: (context) => const MainApp(),
        ROW: (context) => const RowApp(),
        COLUMN: (context) => const ColumnApp(),
        ICONS: (context) => const IconsApp(),
        PAGE_IMPLEMENTATION: (context) => const PageImplementation(),
        ROWS_AND_COLUMNS: (context) => const RowsAndColumnsApp(),
        COUNTER: (context) => const CounterApp(),
        INSTAGRAM: (context) => const Instagram()
      },
    debugShowCheckedModeBanner: false,
    ),
  );
}
