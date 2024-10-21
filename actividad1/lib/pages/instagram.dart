import 'package:flutter/material.dart';
import '../widgets/common_widgets.dart';
import '../utils/constants.dart';
import '../widgets/instagram_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Instagram extends StatelessWidget {
  const Instagram({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Actividad 1',
        home: Scaffold(
          appBar: AppBar(
              title: Text('nombredeperfil   ▼',
                  style: GoogleFonts.rubik(
                      fontSize: 18, fontWeight: FontWeight.bold))),
          endDrawer: const MenuDrawer(markedLink: INSTAGRAM),
          body: Column(
            children: [
              const UserData(
                  imageUrl: 'assets/images/instagram/perfil-instagram.png',
                  publicaciones: '1029',
                  seguidores: '859',
                  seguidos: '211'),
              const Description(
                nombreUsuario: 'Nombre completo del usuario',
                descripcion: 'Frase descriptiva establecida por el usuario',
                url: 'enlaceweb.com/',
              ),
              const EditProfile(),
              const Contacts(),
              const IconsShow(),

              Expanded(
                child: GridView.count(
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                crossAxisCount: 3,
                children: List.generate(9, (index) {
                  return SizedBox(
                    child: Image.asset(
                      'assets/images/instagram/grid-${index + 1}.png',
                      fit: BoxFit.cover,
                    ),
                  );
                }),
              ))
              
              
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(icon: const Icon(Icons.home_outlined, size: 34), onPressed: () {}),
                IconButton(icon: const Icon(Icons.search, size: 34), onPressed: () {}),
                IconButton(icon: const Icon(Icons.add_box_outlined, size: 34), onPressed: () {}),
                IconButton(icon: const Icon(Icons.favorite_border, size: 34), onPressed: () {}),
                const ContactMe(),
              ],
            )
          )
        ));
  }
}
