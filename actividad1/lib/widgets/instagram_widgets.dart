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
            Text(publicaciones, style: GoogleFonts.rubik(fontWeight: FontWeight.bold)),
            Text('Publicacio...', style: GoogleFonts.rubik())
          ],
        ), 
        Column(
          children: [
            Text(seguidores, style: GoogleFonts.rubik(fontWeight: FontWeight.bold)),
            Text('Seguidores', style: GoogleFonts.rubik())
          ],
        ), 
        Column(
          children: [
            Text(seguidos, style: GoogleFonts.rubik(fontWeight: FontWeight.bold)),
            Text('Seguidos', style: GoogleFonts.rubik())
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
        border: Border.all(color: Colors.grey.shade500, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(6))
      ),
      child: Text(
        'Editar perfil',
        style: GoogleFonts.rubik(fontWeight: FontWeight.w500),
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
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16, bottom: 4),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1, 
              color: Colors.black54
            ),
            borderRadius: BorderRadius.circular(48)  
          ),
          child: ClipOval(
            child: Image.asset(imageUrl, width: 48),
          ),
          
        ),
        Text(
          nombreContacto,
          style: GoogleFonts.rubik(fontWeight: FontWeight.w500, fontSize: 13)
        )
      ],
    );
  }
}

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16, bottom: 4),
              padding: const EdgeInsets.all(5.0),

              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black54, 
                  width: 1
                ),
                borderRadius: BorderRadius.circular(50)
              ),

              child: const Icon(Icons.add, size: 38, color: Colors.black87)
            ),
            Text(
              'Nuevo',
              style: GoogleFonts.rubik(fontWeight: FontWeight.w500, fontSize: 13)
            )
          ]
        ),
        const Contact(
          imageUrl: 'assets/images/instagram/instagram-contacto1.png',
          nombreContacto: 'Contacto1'
        ),
        const Contact(
          imageUrl: 'assets/images/instagram/instagram-contacto2.png',
          nombreContacto: 'Contacto2'
        ),
        const Contact(
          imageUrl: 'assets/images/instagram/instagram-contacto3.png',
          nombreContacto: 'Contacto3'
        ),
        const Contact(
          imageUrl: 'assets/images/instagram/instagram-contacto4.png',
          nombreContacto: 'Contacto4'
        ),
        
        
      ],
    );
  }
}

class IconsShow extends StatelessWidget {
  const IconsShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(top: 15),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.black12, width: 2))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          Container(
            // Obtención de la mitad del tamaño total de la pantalla
            width: MediaQuery.of(context).size.width / 2,
            padding: const EdgeInsets.only(bottom: 5),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black45, width: 2))
            ),
          child: const Icon(Icons.grid_on, size: 32),
          ),

          Container(
            width: MediaQuery.of(context).size.width / 2,
            padding: const EdgeInsets.only(bottom: 5),
          child: const Icon(Icons.photo_camera_front_outlined, size: 32, color: Colors.black54,)
          ),
          
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
