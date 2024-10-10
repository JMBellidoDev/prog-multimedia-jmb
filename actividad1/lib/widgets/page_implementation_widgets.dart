import 'package:flutter/material.dart';

class PageImplementationBody extends StatelessWidget {
  const PageImplementationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          Colors.blue.shade300,
          Colors.white,
        ],
        stops: const [0.3, 0.75],
      ),
      ),
      child: Column(
        children: [

          // Texto con todos los bordes redondeados
          Container(
            margin: const EdgeInsets.all(40),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.shade800,
                  blurRadius: 7,
                  offset: const Offset(4, 4),
                  spreadRadius: 5
                )
              ]
            ),
            child: const Text(
              'Texto de prueba',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          // Texto con 2 bordes redondeados
          Container(
            margin: const EdgeInsets.all(40),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(40.0),
                bottomLeft: Radius.circular(40.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.shade800,
                  blurRadius: 5,
                  offset: const Offset(-4, -4),
                  spreadRadius: 4
                )
              ]
            ),
            child: Text(
              'Texto de prueba',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.grey.shade100,
                    offset: const Offset(1, 1),
                    blurRadius: 2
                  )
                ]
              
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(40),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(
                color: Colors.blue.shade600,
                width: 4,
              ),
              borderRadius: BorderRadius.circular(50.0),
              gradient: LinearGradient(
                colors: [Colors.white, Colors.blue.shade200],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 5),
                  blurRadius: 3,
                  color: Colors.blue.shade100,
                  spreadRadius: 3
                )
              ]
            ),
            child: Text(
              'Texto de prueba',
              style: TextStyle(
                fontSize: 28, 
                color: Colors.blue.shade800, 
                fontWeight: FontWeight.bold
              ),
            ),
          )
        ]
      )
    );
  }
}