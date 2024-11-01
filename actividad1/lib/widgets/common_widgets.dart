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
            child: Text(headerText, 
              style: GoogleFonts.rubik(
                color: Colors.white,
                fontSize: 26
              ),
            )
          ),
          backgroundColor: Colors.blue,
          toolbarHeight: 80,
        );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}

class InkedDrawerText extends StatelessWidget {

  final String url;
  final bool marked;

  const InkedDrawerText({super.key, required this.url, required this.marked});

  Widget getPageWithUrl(String url) {
    switch (url) {
      case HOME:
        return const MainApp();
      
      case ROW:
        return const RowApp();

      case COLUMN:
        return const ColumnApp();

      case ICONS:
        return const IconsApp();

      case PAGE_IMPLEMENTATION:
        return const PageImplementation();
        
      case ROWS_AND_COLUMNS:
        return const RowsAndColumnsApp();
      
      case COUNTER: 
        return const CounterApp();

      case INSTAGRAM:
        return const Instagram();

      case GAME:
        return const GameApp();

      default:
        return const MainApp();
    }
  }

  String getDrawerText(String url) {
        switch (url) {
      case HOME:
        return 'Home';
      
      case ROW:
        return 'Row';

      case COLUMN:
        return 'Column';

      case ICONS:
        return 'Icons';

      case PAGE_IMPLEMENTATION:
        return 'Page Implementation';
        
      case ROWS_AND_COLUMNS:
        return 'Rows and Columns';
      
      case COUNTER: 
        return 'Counter';

      case INSTAGRAM:
        return 'Instagram';

      case GAME:
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
              Navigator.of(context).pop();
              Navigator.pushNamed(context, url);
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
                InkedDrawerText(url: HOME, marked: markedLink == HOME),
                InkedDrawerText(url: ROW, marked: markedLink == ROW),
                InkedDrawerText(url: COLUMN, marked: markedLink == COLUMN),
                InkedDrawerText(url: ICONS, marked: markedLink == ICONS),
                InkedDrawerText(url: PAGE_IMPLEMENTATION, marked: markedLink == PAGE_IMPLEMENTATION),
                InkedDrawerText(url: ROWS_AND_COLUMNS, marked: markedLink == ROWS_AND_COLUMNS),
                InkedDrawerText(url: COUNTER, marked: markedLink == COUNTER),
                InkedDrawerText(url: INSTAGRAM, marked: markedLink == INSTAGRAM),
                InkedDrawerText(url: GAME, marked: markedLink == GAME)
              ],
            ),
          )
          
        ],
      )
    );
  }
}