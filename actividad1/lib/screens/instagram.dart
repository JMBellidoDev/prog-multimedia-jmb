import 'package:flutter/material.dart';
import '../widgets/common_widgets.dart';
import '../utils/app_routes.dart';
import '../widgets/instagram_widgets.dart';

class Instagram extends StatelessWidget {
  const Instagram({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('nombredeperfil   ▼',
              style: Theme.of(context).textTheme.headlineSmall)),
      endDrawer: const MenuDrawer(markedLink: AppRoutes.instagram),
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
