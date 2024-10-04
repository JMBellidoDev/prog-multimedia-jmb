import 'package:flutter/material.dart';
import '../widgets/common_widgets.dart';
import '../widgets/main_widgets.dart';
import '../utils/constants.dart';


class MainApp extends StatelessWidget {

  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      title: 'Actividad 1',
      home: Scaffold(
        appBar: HeaderBar(headerText: 'Página principal'),
        drawer: MenuDrawer(markedLink: HOME),
        body: BodyApp(),
      )
    );

  }
}