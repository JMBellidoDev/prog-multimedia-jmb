import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/screens.dart';

class HeaderBar extends StatelessWidget implements PreferredSizeWidget {

  final String headerText;

  const HeaderBar({super.key, required this.headerText});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text(
          headerText, 
          style: Theme.of(context).textTheme.headlineLarge
        )
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(68.0);
}

class InkedDrawerText extends StatelessWidget {

  final String url;
  final bool marked;

  const InkedDrawerText({super.key, required this.url, required this.marked});

  Widget getPageWithUrl(String url) {
    switch (url) {
      case AppRoutes.home:
        return const MainApp();
      
      case AppRoutes.row:
        return const RowApp();

      case AppRoutes.column:
        return const ColumnApp();

      case AppRoutes.icons:
        return const IconsApp();

      case AppRoutes.pageImplementation:
        return const PageImplementation();
        
      case AppRoutes.rowsAndColumns:
        return const RowsAndColumnsApp();
      
      case AppRoutes.counter: 
        return const CounterApp();

      case AppRoutes.instagram:
        return const Instagram();

      case AppRoutes.game:
        return const GameApp();

      default:
        return const MainApp();
    }
  }

  String getDrawerText(String url) {
        switch (url) {
      case AppRoutes.home:
        return 'Home';
      
      case AppRoutes.row:
        return 'Row';

      case AppRoutes.column:
        return 'Column';

      case AppRoutes.icons:
        return 'Icons';

      case AppRoutes.pageImplementation:
        return 'Page Implementation';
        
      case AppRoutes.rowsAndColumns:
        return 'Rows and Columns';
      
      case AppRoutes.counter: 
        return 'Counter';

      case AppRoutes.instagram:
        return 'Instagram';

      case AppRoutes.game:
        return 'Game';

      default:
        return 'Home';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      border: Border.all(
        color: marked ? Colors.blue : Colors.black, // Color del borde
        width: 0.2, // Ancho del borde
        )
      ),
      child: Ink(
        color: marked ? Colors.blue : const Color.fromRGBO(247, 242, 250, 1),
        child: ListTile(
          title: Text(
            getDrawerText(url),
            style: GoogleFonts.rubik(
              color: marked ?Colors.white : Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            )),
            onTap: 
            !marked ? () {
              Navigator.pushReplacementNamed(context, url);
            } : () {},
        )
      )
    );
  }
}


class MenuDrawer extends StatelessWidget {

  final String markedLink;

  const MenuDrawer({super.key, required this.markedLink});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [

          // Cabecera
          UserAccountsDrawerHeader(
            accountName: Text(
              'José Martín Bellido',
              style: GoogleFonts.rubik(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )
            ), accountEmail: Text(
              'jmarbel857@g.educaand.es',
              style: GoogleFonts.rubik(
                color: const Color.fromARGB(255, 0, 43, 117),
                fontWeight: FontWeight.bold,
                fontSize: 15
              )
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/coding.jpg'),
                fit: BoxFit.cover,
                opacity: .4
              )
            )
          ),

          // Enlaces
          Expanded(
            child: ListView(
              children: [
                InkedDrawerText(url: AppRoutes.home, marked: markedLink == AppRoutes.home),
                InkedDrawerText(url: AppRoutes.row, marked: markedLink == AppRoutes.row),
                InkedDrawerText(url: AppRoutes.column, marked: markedLink == AppRoutes.column),
                InkedDrawerText(url: AppRoutes.icons, marked: markedLink == AppRoutes.icons),
                InkedDrawerText(url: AppRoutes.pageImplementation, marked: markedLink == AppRoutes.pageImplementation),
                InkedDrawerText(url: AppRoutes.rowsAndColumns, marked: markedLink == AppRoutes.rowsAndColumns),
                InkedDrawerText(url: AppRoutes.counter, marked: markedLink == AppRoutes.counter),
                InkedDrawerText(url: AppRoutes.instagram, marked: markedLink == AppRoutes.instagram),
                InkedDrawerText(url: AppRoutes.game, marked: markedLink == AppRoutes.game)
              ],
            ),
          )
          
        ],
      )
    );
  }
}