import '../widgets/icons_widgets.dart';
import 'package:flutter/material.dart';
import '../widgets/common_widgets.dart';
import '../utils/app_routes.dart';


class IconsApp extends StatelessWidget {

  const IconsApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      appBar: HeaderBar(headerText: 'Icons'),
      drawer: MenuDrawer(markedLink: AppRoutes.icons),
      body: BodyIcons(),
      
    );

  }
}