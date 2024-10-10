import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/main_app.dart';
import '../pages/page.dart';
import '../pages/row.dart';
import '../pages/column.dart';
import '../pages/icons.dart';
import '../pages/rows_and_columns.dart';
import '../utils/constants.dart';

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

  final String text;
  final bool marked;

  const InkedDrawerText({super.key, required this.text, required this.marked});

  Widget getPageWithText(String text) {
    switch (text) {
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
      
      default:
        return const MainApp();
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
            text,
            style: GoogleFonts.rubik(
              color: marked ?Colors.white : Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            )),
            onTap: 
            !marked ? () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => getPageWithText(text)
              ));
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
                InkedDrawerText(text: 'Home', marked: markedLink == HOME),
                InkedDrawerText(text: 'Row', marked: markedLink == ROW),
                InkedDrawerText(text: 'Column', marked: markedLink == COLUMN),
                InkedDrawerText(text: 'Icons', marked: markedLink == ICONS),
                InkedDrawerText(text: 'Page', marked: markedLink == PAGE_IMPLEMENTATION),
                InkedDrawerText(text: 'Rows and Columns', marked: markedLink == ROWS_AND_COLUMNS)
              ],
            ),
          )
          
        ],
      )
    );
  }
}