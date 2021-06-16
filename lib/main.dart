import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(MaterialApp(
      home: Scaffold(
    backgroundColor: Colors.red,
    appBar: AppBar(
      title: Text("Dice"),
      backgroundColor: Colors.red,
    ),
    body: DicePage(),
  )));
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  // サイコロの目を格納する変数の初期化
  var leftDiceNumber = 1;
  var rightDiceNumber = 1;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  String sum() {
    return (leftDiceNumber + rightDiceNumber).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(children: [
            Expanded(
                child: TextButton(
              onPressed: () {
                changeDiceFace();
              },
              child: Image.asset("assets/images/dice$leftDiceNumber.png"),
            )),
            Expanded(
                child: TextButton(
              onPressed: () {
                changeDiceFace();
              },
              child: Image.asset("assets/images/dice$rightDiceNumber.png"),
            )),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Text(
              leftDiceNumber.toString(),
              style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              rightDiceNumber.toString(),
              style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Text(
              "目の合計:" + sum(),
              style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ])
        ],
      ),
    );
  }
}
