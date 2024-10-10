import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RowsAndColumnsBody extends StatelessWidget {
  const RowsAndColumnsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Item()
          ]
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Item(),
            Item()
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Item(),
            Item(),
            Item()
          ],
        )
      ],
    );
  }
}

class Item extends StatelessWidget {
  const Item({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.phone_in_talk_outlined,
          color: Colors.black,
          size: 64,
          shadows: [
            Shadow(
              color: Colors.grey.shade900,
              blurRadius: 2,
              offset: const Offset(1, 1)
            )
          ],
        ),
        Text(
          'Llamar por teléfono',
          style: GoogleFonts.rubik(
            color: Colors.black,
            fontSize: 10,
            fontWeight: FontWeight.bold
          )
        )
      ]
    );
  }
}