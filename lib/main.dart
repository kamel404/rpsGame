// ignore_for_file: unused_field, unused_local_variable, unused_element

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_emoji/flutter_emoji.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: RPSGame()));
}

// Choices of possible moves
enum Move { rock, paper, scissors }

// Fucntion to get the result(outcome) of the game
String getOutcome(Move player, Move computer) {
  if (player == computer) return "It's a tie!";
  if ((player == Move.rock && computer == Move.scissors) ||
      (player == Move.scissors && computer == Move.paper) ||
      (player == Move.paper && computer == Move.rock)) {
    return "You win!";
  } else {
    return "You Lose!";
  }
}

// Function to get random move from Computer
Move getRandomMove() {
  return Move.values[Random().nextInt(3)];
}

class RPSGame extends StatefulWidget {
  const RPSGame({super.key});

  @override
  State<RPSGame> createState() => _RPSGameState();
}

class _RPSGameState extends State<RPSGame> {
  Move? _playerMove;
  Move? _computerMove;
  String _resultMessage = 'Make your Move!';
  final String _playerName = 'You';
  final String _computerName = 'Computer';
  var paper = Emoji('paper', '🖐️');
  var rock = Emoji('rock', '✊');
  var scissors = Emoji('scissors', '✌');
  var tie = Emoji('tie', '🤝');
  var win = Emoji('win', '🥳');
  var lose = Emoji('lose', '🥺');
  var question = Emoji('question', '❓');

  // Fucntion to when he click a choice
  void playGame(Move playerChoice) {
    final computerChoice = getRandomMove();
    final outcome = getOutcome(playerChoice, computerChoice);

    setState(() {
      _playerMove = playerChoice;
      _computerMove = computerChoice;
      _resultMessage = outcome;
    });
  }

  // Fucntion to reset the game
  void _resetGame() {
    setState(() {
      _playerMove = null;
      _computerMove = null;
      _resultMessage = 'Make your Move!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rock Paper Scissors'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(33, 96, 203, 1)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$_playerName: ${_playerMove?.name ?? question.code}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  '$_computerName: ${_computerMove?.name ?? question.code}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  _resultMessage,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                // Buttons for the moves
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => playGame(Move.rock),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0x00000000),
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                      ),
                      child: Text(rock.code, style: TextStyle(fontSize: 40)),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () => playGame(Move.paper),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0x00000000),
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                      ),
                      child: Text(paper.code, style: TextStyle(fontSize: 40)),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () => playGame(Move.scissors),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0x00000000),
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                      ),
                      child: Text(
                        scissors.code,
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
