import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Game',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Game'),
        ),
        body: GamePage(),
      ),
    );
  }
}

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int targetNumber = Random().nextInt(100);
  int userGuess=0;
  String message = '';

  void checkGuess() {
    setState(() {
      if (userGuess == targetNumber) {
        message = 'You got it right!';
      } else if (userGuess > targetNumber) {
        message = 'Too high!';
      } else {
        message = 'Too low!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Guess a number between 0 and 100'),
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              userGuess = int.parse(value);
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: checkGuess,
            child: Text('Guess'),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(message),
        ],
      ),
    );
  }
}
