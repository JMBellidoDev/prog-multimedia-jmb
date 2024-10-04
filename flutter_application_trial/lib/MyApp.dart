import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi primera aplicación',
      //home: Image.asset('assets/images/moodeng.jpeg')
      /*home: Icon(
        Icons.favorite,
        color: Colors.pink,
        size: 30.0) */

      /*home: Center(
        child: Text(
          "Hola mundo!",
          style: TextStyle(
            color: Color.fromARGB(255, 109, 155, 163),
            fontSize: 30.0,
            decoration: TextDecoration.none,
            letterSpacing: 2
          )
        )
      )*/

      home: Row(
        children: [
          const Text('baaa'),
          const Icon(
            Icons.abc,
            size: 50.0,
            color: Colors.amber
          ),
          const Icon(
            Icons.ac_unit,
            size: 50.0,
            color: Colors.amberAccent
          ),
          const Spacer(flex: 2),
          const Icon(
            Icons.access_alarm,
            size: 50.0,
            color: Colors.amber
          ),
          Text(
            'aaa',
            style: GoogleFonts.abel(
              color: Colors.cyanAccent,
              fontSize: 20
            ),
          )
        ],)
    ); 
  }
}
