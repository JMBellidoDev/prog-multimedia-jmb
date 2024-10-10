import '../widgets/page_implementation_widgets.dart';
import 'package:flutter/material.dart';
import '../widgets/common_widgets.dart';
import '../utils/constants.dart';


class PageImplementation extends StatelessWidget {

  const PageImplementation({super.key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      title: 'Actividad 2',
      home: Scaffold(
        appBar: HeaderBar(headerText: 'Page Implementation'),
        drawer: MenuDrawer(markedLink: PAGE_IMPLEMENTATION),
        body: PageImplementationBody(),
      )
    );

  }
}