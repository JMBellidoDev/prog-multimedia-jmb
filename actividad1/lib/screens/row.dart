import '../widgets/row_widgets.dart';
import 'package:flutter/material.dart';
import '../widgets/common_widgets.dart';
import '../utils/constants.dart';


class RowApp extends StatelessWidget {

  const RowApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      appBar: HeaderBar(headerText: 'Row'),
      drawer: MenuDrawer(markedLink: ROW),
      body: BodyRow(),
    );

  }
}