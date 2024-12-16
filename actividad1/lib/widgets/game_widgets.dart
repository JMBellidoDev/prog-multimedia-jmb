import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

// Tiempos para el Timer
const int startTimer = 1500;
const int endTimer = 1000;

// Constantes para la puntuación
const String firstScore = 'first_score';
const String secondScore = 'second_score';
const String thirdScore = 'third_score';

var scores = {
  firstScore: 0,
  secondScore: 0,
  thirdScore: 0
};


// Tamaño de las imagenes
int imageSize = 96;

// Imágenes del juego
var images = [
  'assets/images/game/calabaza.png',
  'assets/images/game/caramelo.png',
  'assets/images/game/cat.png', 
  'assets/images/game/murcielago.png'
];

class GameBody extends StatefulWidget {
  const GameBody({super.key});

  @override
  State<GameBody> createState() => _GameBodyState();
}



class _GameBodyState extends State<GameBody> {

  // Variables del juego
  bool gameStarted = false;
  int score = 0;
  int newScore = 0;
  var position = [-1.0, -1.0];
  String image = images[0];
  int timerInterval = startTimer;

  // Generador de números aleatorios
  Random random = Random();

  // Booleano que indica si se ha clickado en la imagen durante la iteración y si se ha modificado la velocidad de juego
  bool clicked = false;
  bool changedTimer = false;

  // Timer
  Timer? timer;

  // Lee las puntuaciones del almacenamiento local (Shared Preferences)
  loadScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    scores[firstScore] = prefs.getInt(firstScore) ?? 0;
    scores[secondScore] = prefs.getInt(secondScore) ?? 0;
    scores[thirdScore] = prefs.getInt(thirdScore) ?? 0;

    setState(() {
      score = (prefs.getInt('personal_score') ?? 0);
      newScore = score;
    });
  }

  // Establece la puntuación en el almacenamiento local (Shared Preferences) y actualiza las mejores puntuaciones
  setScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (scores[firstScore] !< score) {
      scores[thirdScore] = scores[secondScore] ?? 0; 
      scores[secondScore] = scores[firstScore] ?? 0;
      scores[firstScore] = score;

    } else if (scores[secondScore] !< score) {
      scores[thirdScore] = scores[secondScore] ?? 0;
      scores[secondScore] = score;

    } else if (scores[thirdScore] !< score) {
      scores[thirdScore] = score;
    }

    setState(() {
      prefs.setInt('personal_score', score);
      prefs.setInt(firstScore, scores[firstScore] ?? 0);
      prefs.setInt(secondScore, scores[secondScore] ?? 0);
      prefs.setInt(thirdScore, scores[thirdScore] ?? 0);
    });
  }


  @override
  void initState() {
    super.initState();
    loadScore();
  }


  @override
  Widget build(BuildContext context) {

  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;

    // Calcula la posición para la imagen de forma aleatoria
    getRandomPosition() {

      // alturaDisponible = alturaPantalla - alturaPuntuacion - alturaBotones - alturaAppBar - alturaImagen
      double availableHeight = screenHeight - (screenHeight * 0.15) - (screenHeight * 0.15) - 78 - imageSize;

      double positionX = random.nextDouble() * (screenWidth - imageSize);
      double positionY = random.nextDouble() * availableHeight;

      return [positionX, positionY];
    }

    // Calcula la nueva imagen
    getRandomImage() {
      return images[random.nextInt(4)];
    }

    // Establece el temporizador del juego en función del tiempo establecido
    void setTimer(int time) {
      timer = Timer.periodic(Duration(milliseconds: time), (timer) {
        setState(() {
          position = getRandomPosition();
          image = getRandomImage();
          score = newScore;
          clicked = false;
        });
        newScore -= 2;
      });
    }

    // Acción para iniciar el juego (sólo si no se ha iniciado)
    void playGame() {
      if (!gameStarted) {
        score = 0;
        newScore = 0;
        setTimer(timerInterval);
        gameStarted = true;
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Juego iniciado'), 
            duration: const Duration(seconds: 1),
            showCloseIcon: true,
            backgroundColor: Colors.green.shade700,
          )
        );
      }
    }

    // Acción para finalizar el juego
    void finishGame() {
      timer?.cancel();
      setScore();
      
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Fin de Partida'),
              children: <Widget>[
                Flex(
                  direction: Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Tu puntuación', style: Theme.of(context).textTheme.labelLarge),
                    Text(score.toString(), style: Theme.of(context).textTheme.labelLarge),
                    Text('Mejores Puntuaciones', style: Theme.of(context).textTheme.labelLarge),
                    Text('1º - ${scores[firstScore]}', style: Theme.of(context).textTheme.labelMedium),
                    Text('2º - ${scores[secondScore]}', style: Theme.of(context).textTheme.labelMedium),
                    Text('3º - ${scores[thirdScore]}', style: Theme.of(context).textTheme.labelMedium),
                    SimpleDialogOption(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Aceptar', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                    )
                  ],
                )
                
              ]
            );
          }
        );

      setState(() {
      });


    }

    // Acción para resetear el juego. Resetea puntuación, posición de imagen, tiempo de intervalos, Timer y booleanos de juego
    void resetGame() {
      setState(() {
        score = 0;
        newScore = 0;
        position = [-1, -1];
        timerInterval = startTimer;
        timer?.cancel();

        gameStarted = false;
        clicked = false;
        changedTimer = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Juego reiniciado'), 
          duration: const Duration(seconds: 1),
          showCloseIcon: true,
          backgroundColor: Colors.green.shade400,
        )
      );

    }

    // Acción al hacer click en la imagen
    void onTapImage() {

      // Solo se suma puntuación una vez
      if (!clicked) {
        newScore += 3;
        setState((){
          clicked = true;
        });
      }

      // Se aumenta el tiempo solo si la puntuación es 15 y no ha cambiado ya antes
      if (score == 15 && !changedTimer) {
        timer?.cancel();
        setTimer(endTimer);
        changedTimer = true;
      }

    }

    return Column(children: [

      // Contenedor de la puntuación
      Container(
        height: screenHeight * 0.15,
        alignment: Alignment.center,
        child: Text(
          'Puntuación: $score',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),

      // Contenedor del juego
      Expanded(
        child: Visibility(
          visible: position[0] != -1,
          child: Stack(
            children: [
              Positioned(
                right: position[0],
                top: position[1],
                child: GestureDetector(
                  onTap: onTapImage,
                  child: Image.asset(image)
                )
              )
            ],
          )
        )
      ),

      // Contenedor de los botones
      Container(
        height: screenHeight * 0.15,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.blue,
          border: Border(
            top: BorderSide(
              color: Colors.black, // Color del borde
              width: 2, // Grosor del borde
            )
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: playGame,
              style: ElevatedButton.styleFrom(
                elevation: 8,
              ),
              child: Icon(
                Icons.play_arrow, 
                color: Colors.blue.shade500, 
                fill: 0.5, 
                size: 40,
              )
            ),
            ElevatedButton(
              onPressed: finishGame,
              style: ElevatedButton.styleFrom(
                elevation: 8,

              ),
              child: Icon(
                Icons.stop, 
                color: Colors.red.shade500, 
                fill: 0.5, 
                size: 40,
              )
            ),
            ElevatedButton(
              onPressed: resetGame,
              style: ElevatedButton.styleFrom(
                elevation: 8,

              ),
              child: Icon(
                Icons.restart_alt_rounded, 
                color: Colors.green.shade800, 
                fill: 0.5, 
                size: 40,
              )
            )
          ],
        ),
      )
      
    ]);
  }
}
