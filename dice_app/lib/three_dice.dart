import 'dart:math';
import 'package:flutter/material.dart';

class threeDiceGame extends StatefulWidget {
  const threeDiceGame({Key? key}) : super(key: key);

  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<threeDiceGame> {
  final diceList = const [
    'assets/d1.jpg',
    'assets/d2.jpg',
    'assets/d3.jpg',
    'assets/d4.jpg',
    'assets/d5.jpg',
    'assets/d6.jpg',
  ];
  final random = Random.secure();
  var index1 = 0;
  var index2 = 0;
  var index3=0;
  var score = 0;
  var diceSum = 0;
  var isOver = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dice Game'),
        backgroundColor: Colors.orange,
      ),
      body: Center(


        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Score:$score',
              style: const TextStyle(fontSize: 30,color: Colors.white,backgroundColor: Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  diceList[index1],
                  width: 150,
                  height: 150,
                ),
                const SizedBox(
                  width: 10,
                  height: 10,
                ),
                Image.asset(
                  diceList[index2],
                  width: 150,
                  height: 150,
                ),
                const SizedBox(
                  width: 10,
                  height: 10,
                ),

                Image.asset(
                  diceList[index3],
                  width: 150,
                  height: 150,
                ),


              ],
            ),


            Text(
              'Dice Sum:$diceSum',
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white,backgroundColor: Colors.black),

            ),
            if (isOver)
              Text(
                'GAME OVER',
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white,backgroundColor: Colors.black,),
              ),
            ElevatedButton(
              onPressed: _rollTheDice,
              child: const Text(
                'Roll',
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }

  void _rollTheDice() {
    setState(() {
      index1 = random.nextInt(6);
      index2 = random.nextInt(6);
      diceSum = index1 + index2 + 2;
      if (diceSum == 7) {
        isOver = true;
      } else {
        score += diceSum;
      }
    });
  }
}
