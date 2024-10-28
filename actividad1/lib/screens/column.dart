import '../widgets/column_widgets.dart';
import 'package:flutter/material.dart';
import '../widgets/common_widgets.dart';
import '../utils/constants.dart';


class ColumnApp extends StatelessWidget {

  const ColumnApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      appBar: HeaderBar(headerText: 'Column'),
      drawer: MenuDrawer(markedLink: COLUMN),
      body: BodyColumn(),
      
    );

  }
}