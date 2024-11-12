import '../widgets/page_implementation_widgets.dart';
import 'package:flutter/material.dart';
import '../widgets/common_widgets.dart';
import '../utils/app_routes.dart';


class PageImplementation extends StatelessWidget {

  const PageImplementation({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      appBar: HeaderBar(headerText: 'Page Implementation'),
      drawer: MenuDrawer(markedLink: AppRoutes.pageImplementation),
      body: PageImplementationBody(),
    );

  }
}