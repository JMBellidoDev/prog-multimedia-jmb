import 'package:flutter/material.dart';

class BodyApp extends StatelessWidget {

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
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          Text(
            githubUrl,
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
          )
        ],
      )
    );
  }
}