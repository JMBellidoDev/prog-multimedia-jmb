import 'package:flutter/material.dart';
import '../widgets/common_widgets.dart';
import '../utils/constants.dart';
import '../widgets/instagram_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Instagram extends StatelessWidget {
  const Instagram({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('nombredeperfil   ▼',
              style: GoogleFonts.rubik(
                  fontSize: 18, fontWeight: FontWeight.bold))),
      endDrawer: const MenuDrawer(markedLink: INSTAGRAM),
      body: const Column(
        children: [
          UserData(
              imageUrl: 'assets/images/instagram/perfil-instagram.png',
              publicaciones: '1029',
              seguidores: '859',
              seguidos: '211'),
          Description(
            nombreUsuario: 'Nombre completo del usuario',
            descripcion: 'Frase descriptiva establecida por el usuario',
            url: 'enlaceweb.com/',
          ),
          EditProfile(),
          Contacts(),
          IconsShow(),
          ImageGrid()
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarInstagram()
    );
  }
}
