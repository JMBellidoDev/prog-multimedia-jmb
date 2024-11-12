import 'package:flutter/material.dart';
import '../widgets/game_widgets.dart';
import '../widgets/common_widgets.dart';
import '../utils/app_routes.dart';


class GameApp extends StatelessWidget {

  const GameApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      appBar: HeaderBar(headerText: 'Game'),
      drawer: MenuDrawer(markedLink:  AppRoutes.game),
      body: GameBody(),
    );

  }
}