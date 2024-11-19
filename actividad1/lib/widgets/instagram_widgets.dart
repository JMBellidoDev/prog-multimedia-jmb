import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserData extends StatelessWidget {

  final String imageUrl;
  final String publicaciones;
  final String seguidores;
  final String seguidos;

  const UserData({super.key, required this.imageUrl, required this.publicaciones, required this.seguidores, required this.seguidos});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ClipOval(
          child: Image.asset(
            imageUrl, 
            width: 76,),
        ),
        Column(
          children: [
            Text(publicaciones, style: Theme.of(context).textTheme.labelMedium),
            Text('Publicacio...', style: Theme.of(context).textTheme.bodyMedium)
          ],
        ), 
        Column(
          children: [
            Text(seguidores, style: Theme.of(context).textTheme.labelMedium),
            Text('Seguidores', style: Theme.of(context).textTheme.bodyMedium)
          ],
        ), 
        Column(
          children: [
            Text(seguidos, style: Theme.of(context).textTheme.labelMedium),
            Text('Seguidos', style: Theme.of(context).textTheme.bodyMedium)
          ],
        ), 
      ],
    );
  }
}

class Description extends StatelessWidget {

  final String nombreUsuario;
  final String descripcion;
  final String url;

  const Description({super.key, required this.nombreUsuario, required this.descripcion, required this.url});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 12),
          child: Row(
            children: [
              Text(
                nombreUsuario, 
                style: GoogleFonts.rubik()
              )
            ]
          )
        ), 
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              Text(
                descripcion, 
                style: Theme.of(context).textTheme.bodyMedium
              )
            ]
          )
        ), 
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              Text(
                url, 
                style: GoogleFonts.rubik(
                  color: Colors.blue.shade900
                )
              )
            ]
          )
        ), 
      ]
    );
  }
}

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(6))
      ),
      child: Text(
        'Editar perfil',
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}

class Contact extends StatelessWidget {
  final String imageUrl;
  final String nombreContacto;

  const Contact({super.key, required this.imageUrl, required this.nombreContacto});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80, // Especifica un ancho fijo
      margin: const EdgeInsets.symmetric(horizontal: 4), // Espacio entre los contactos
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 16, bottom: 4),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1, 
                color: Colors.black54,
              ),
              borderRadius: BorderRadius.circular(48),
            ),
            child: ClipOval(
              child: Image.asset(
                imageUrl,
                width: 48,
                height: 48,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            nombreContacto,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 16, bottom: 4, left: 12, right: 8),
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).dividerColor, 
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(Icons.add, size: 38),
              ),
              Text(
                'Nuevo',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
          const Contact(
            imageUrl: 'assets/images/instagram/instagram-contacto1.png',
            nombreContacto: 'Contacto1',
          ),
          const Contact(
            imageUrl: 'assets/images/instagram/instagram-contacto2.png',
            nombreContacto: 'Contacto2',
          ),
          const Contact(
            imageUrl: 'assets/images/instagram/instagram-contacto3.png',
            nombreContacto: 'Contacto3',
          ),
          const Contact(
            imageUrl: 'assets/images/instagram/instagram-contacto4.png',
            nombreContacto: 'Contacto4',
          ),
          const Contact(
            imageUrl: 'assets/images/instagram/instagram-contacto5.png', 
            nombreContacto: 'Contacto5'
          )
        ],
      ),
    );
  }
}

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(icon: Icon(Icons.grid_on, size: 32)),
              Tab(icon: Icon(Icons.photo_camera_front_outlined, size: 32)),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                ImageGrid(),
                Profile()
              ],
            ),
          ),
        ],
      ),
    );
  }
}




class ImageGrid extends StatelessWidget {
  const ImageGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
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
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          'Información de Contacto',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: 12),
        Text(
          'Nombre de usuario: nombredeperfil',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        Text(
          'Email: emaildelnombredeperfil@gmail.com',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        Text(
          'Nombre completo: Nombre Completo',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        Text(
          'Fecha de nacimiento: dd-mm-yyyy',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        Text(
          'Página Web: https://enlaceweb.com/',
          style: GoogleFonts.rubik(color: Colors.blue.shade900, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class BottomNavigationBarInstagram extends StatelessWidget {
  const BottomNavigationBarInstagram({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).primaryColor,
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
    );
  }
}

class ContactMe extends StatelessWidget {

  const ContactMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1, 
          color: Colors.black54
        ),
        borderRadius: BorderRadius.circular(48)  
      ),
      child: ClipOval(
        child: Image.asset('assets/images/instagram/perfil-instagram.png', width: 24),
      ),
    );
  }
}