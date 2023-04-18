import 'package:untitled3/dice_game.dart';

//import 'package:dice app/three_dice.dart';
//import 'package:/custom_dice.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice APP',
      theme: ThemeData(
        primaryColorDark: Colors.redAccent
      ),
      home: DiceGame(
        colors:Colors.yellowAccent
      ),



    );
  }
}
