import 'dart:math';

import 'package:attimuitehoi_app/result_display.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Attimuitehoi(),
    );
  }
}

class Attimuitehoi extends StatefulWidget {
  const Attimuitehoi({Key? key}) : super(key: key);

  @override
  State<Attimuitehoi> createState() => _AttimuitehoiState();
}

String up = '👆';
String down = '👇';
String left = '👈';
String right = '👉';

class _AttimuitehoiState extends State<Attimuitehoi> {
  String myHand = '';
  String computerHand = '';
  int count = 0;

  void gameReset() {
    myHand = '';
    computerHand = '';
    count = 0;
  }

  void generateComputerHand() {
    final randomNumber = Random().nextInt(4);
    computerHand = randomNumberToHand(randomNumber);
  }

  String randomNumberToHand(int randomNumber) {
    final directions = [up, left, right, down];
    return directions[randomNumber];
  }

  void selectHand(String selectedHand) {
    setState(() {
      myHand = selectedHand;
    });
  }

  void directionJudge() {
    if (myHand == computerHand) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultDisplay(count)),
      ).then((value) {
        setState(() {
          gameReset();
        });
      });
    } else {
      count++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            count != 0 ? '✖️$count' : 'あっち向いてホイ\n避け続けてみよう！',
            style: TextStyle(fontSize: 32),
          ),
          Text(
            computerHand,
            style: TextStyle(fontSize: 64),
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            myHand,
            style: TextStyle(fontSize: 64),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  selectHand(up);
                  generateComputerHand();
                  directionJudge();
                },
                child: Text(
                  up,
                  style: TextStyle(fontSize: 32),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  selectHand(left);
                  generateComputerHand();
                  directionJudge();
                },
                child: Text(
                  left,
                  style: TextStyle(fontSize: 32),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  selectHand(right);
                  generateComputerHand();
                  directionJudge();
                },
                child: Text(
                  right,
                  style: TextStyle(fontSize: 32),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  selectHand(down);
                  generateComputerHand();
                  directionJudge();
                },
                child: Text(
                  down,
                  style: TextStyle(fontSize: 32),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
