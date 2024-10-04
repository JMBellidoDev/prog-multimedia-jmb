import 'package:flutter/material.dart';

class BodyRow extends StatelessWidget {

  final Color backgroundTextColor = const Color.fromARGB(80, 254, 247, 255);

  const BodyRow({super.key});

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
      child: SizedBox(
        height: double.infinity,
        child: Row (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            Image.asset(
              'assets/images/logo-flutter.png',
              height: 96,
            ),
            const Spacer(),
            Image.asset(
              'assets/images/logo-kotlin.png',
              height: 96,
            ),
            const Spacer(),
            Image.asset(
              'assets/images/logo-swift.png',
              height: 96,
            ),
            const Spacer(),
          ],
        )
      )
    );
  }
}