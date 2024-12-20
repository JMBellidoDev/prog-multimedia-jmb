import '../widgets/rows_and_columns_widgets.dart';
import 'package:flutter/material.dart';
import '../widgets/common_widgets.dart';
import '../utils/app_routes.dart';


class RowsAndColumnsApp extends StatelessWidget {

  const RowsAndColumnsApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      appBar: HeaderBar(headerText: 'Columns and Rows'),
      drawer: MenuDrawer(markedLink: AppRoutes.rowsAndColumns),
      body: RowsAndColumnsBody(),
    );

  }
}