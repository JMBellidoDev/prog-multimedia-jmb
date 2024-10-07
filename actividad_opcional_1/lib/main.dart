import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tarea Opcional',
        home: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.blue.shade200,
              title: Container(
                alignment: Alignment.center,
                child: const Text("Cabecera",
                  style:
                    TextStyle(
                      fontSize: 28, 
                      fontWeight: FontWeight.bold
                    )
                  ),
              )),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.add_shopping_cart, 
                    color: Colors.blue.shade400, 
                    shadows: const [
                      Shadow(
                        color: Colors.black, 
                        offset: Offset(2, 2),
                        blurRadius: 5
                      ),
                    ],
                    size: 96
                  ),
                  const Icon(
                    Icons.zoom_in, 
                    color: Colors.black, 
                    shadows: [
                      Shadow(
                        color: Colors.grey, 
                        offset: Offset(2, 2),
                        blurRadius: 5
                      ),
                    ],
                    size: 96
                  )
                ],
              ), 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.work_rounded, 
                    color: Colors.brown.shade600, 
                    shadows: const [
                      Shadow(
                        color: Colors.black, 
                        offset: Offset(2, 2),
                        blurRadius: 5
                      ),
                    ],
                    size: 96
                  ),
                  const Icon(
                    Icons.wifi_lock, 
                    color: Colors.red, 
                    shadows: [
                      Shadow(
                        color: Colors.grey, 
                        offset: Offset(2, 2),
                        blurRadius: 5
                      ),
                    ],
                    size: 96
                  )
                ],
              ), 
            ]
          )
        ));
  }
}
