import 'package:flutter/material.dart';

class BodyIcons extends StatelessWidget {

  final Color backgroundTextColor = const Color.fromARGB(80, 254, 247, 255);

  const BodyIcons({super.key});

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
        width: double.infinity,
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            Icon(
              Icons.favorite, 
              color: Colors.red.shade400, 
              size: 64,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.5),
                  offset:  const Offset(5, 5),
                  blurRadius: 10
                )
              ]
            ),
            Icon(
              Icons.add_to_home_screen_sharp,
              color: Colors.blue.shade400,
              size: 64,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.5),
                  offset:  const Offset(5, 5),
                  blurRadius: 10
                )
              ]
            ),
            Icon(
              Icons.zoom_out_map,
              color: Colors.black,
              size: 64,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.5),
                  offset:  const Offset(5, 5),
                  blurRadius: 10
                )
              ]
            ),
            Icon(
              Icons.workspace_premium_rounded,
              color: Colors.amber.shade400,
              size: 64,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.5),
                  offset:  const Offset(5, 5),
                  blurRadius: 10
                )
              ]
            ),
            Icon(
              Icons.wifi_tethering_error_outlined,
              color: Colors.red.shade900,
              size: 64,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.5),
                  offset:  const Offset(5, 5),
                  blurRadius: 10
                )
              ]
            )
          ],
        )
      )
    );
  }
}