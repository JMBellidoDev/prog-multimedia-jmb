import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyApp extends StatelessWidget {

  final Color backgroundTextColor = const Color.fromARGB(80, 254, 247, 255);
  final String name = 'José Martín Bellido';
  final String githubUrl = 'https://github.com/JMBellidoDev/prog-multimedia-jmb.git';

  const BodyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      // Imagen de fondo
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/waveline.png'),
          fit: BoxFit.cover,
          opacity: 0.5
        )
      ),
      
      // Contenido
      child: Column (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            name, 
            style: GoogleFonts.rubik(
              color: Colors.black,
              fontSize: 35,
              backgroundColor: backgroundTextColor
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            githubUrl,
            style: GoogleFonts.rubik(
              color: Colors.black,
              fontSize: 24,
              backgroundColor: backgroundTextColor
            ),
            textAlign: TextAlign.center,
          )
        ],
      )
    );
  }
}