import 'package:flutter/material.dart';
import '../widgets/common_widgets.dart';
import '../utils/constants.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterBody();
}

class _CounterBody extends State<CounterApp> {

  int clickNumber = 0;

  increment() {
    setState(() {
    clickNumber++;
    });
  }

  decrement() {
    setState(() {
      clickNumber--;
    });
  }

  reset() {
    setState(() {
      clickNumber = 0;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderBar(headerText: 'Counter'),
      drawer: const MenuDrawer(markedLink: COUNTER),
      body: Stack(
        children: [

          Center(
            child: Text(
              'Has pulsado $clickNumber ${clickNumber == 1 ? 'vez' : 'veces'}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24
              )
            )
          ),

          Positioned(
            bottom: 220,
            right: 20,
            child: ElevatedButton(
              onPressed: increment,
              style: ElevatedButton.styleFrom(
                splashFactory: InkSplash.splashFactory,
                backgroundColor: Colors.blue
              ),
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),

          Positioned(
            bottom: 150,
            right: 20,
            child: ElevatedButton(
              onPressed: decrement,
              style: ElevatedButton.styleFrom(
                splashFactory: InkSplash.splashFactory,
                backgroundColor: Colors.red
              ),
              child: const Icon(Icons.remove, color: Colors.white),
            ),
          ),

          Positioned(
            bottom: 80,
            right: 20,
            child: ElevatedButton(
              onPressed: reset,
              style: ElevatedButton.styleFrom(
                splashFactory: InkSplash.splashFactory,
                backgroundColor: Colors.green
              ),
              child: const Icon(Icons.refresh, color: Colors.white),
            ),
          ),
        ]
      )
      
    );
  }
}



