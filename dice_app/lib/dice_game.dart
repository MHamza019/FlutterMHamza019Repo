import 'dart:math';
import 'package:flutter/material.dart';
import 'package:untitled3/three_dice.dart';
 import 'package:untitled3/custom_dice.dart';
class DiceGame extends StatefulWidget {
  const DiceGame({Key? key, required Object colors}) : super(key: key);

  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
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
  var score = 0;
  var diceSum = 0;
  var isOver = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Dice App',

        ),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Your Score = $score',
              style: const TextStyle(fontSize: 40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  diceList[index1],
                  width: 100,
                  height: 100,
                ),
                const SizedBox(
                  width: 10,
                ),
                Image.asset(
                  diceList[index2],
                  width: 100,
                  height: 100,
                ),
              ],
            ),
            Text(
              'Sum of Dices = $diceSum',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
            ),
            if (isOver)
              Text(
                'GAME OVER',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _rollTheDice,
                  child: const Text(
                    'Roll',
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  width: 30, height: 5
                ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>threeDiceGame()));
                  },
                  child: const Text(
                    'Three Dice',
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),

                SizedBox(
                  width: 30, height: 5,
                ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Customdiceapp()));
                  },
                  child: const Text(
                    'custom Dice',
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),

              ],
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
