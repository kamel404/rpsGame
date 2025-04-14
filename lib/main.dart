// ignore_for_file: unused_field, unused_local_variable, unused_element, prefer_final_fields

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_emoji/flutter_emoji.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: RPSGame()));
}

// Choices of possible moves
enum Move {
  rock('✊'),
  paper('🖐️'),
  scissors('✌️');

  final String symbol;
  const Move(this.symbol);
}

enum Outcome {
  win('You win! 🥳'),
  lose('You Lose! 🥺'),
  tie('It\'s a tie! 🤝');

  final String message;
  const Outcome(this.message);
}

// Fucntion to get the result(outcome) of the game
String getOutcome(Move player, Move computer) {
  if (player == computer) return Outcome.tie.message;
  if ((player == Move.rock && computer == Move.scissors) ||
      (player == Move.scissors && computer == Move.paper) ||
      (player == Move.paper && computer == Move.rock)) {
    return Outcome.win.message;
  } else {
    return Outcome.lose.message;
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
  var question = Emoji('question', '❓');
  var restart = Emoji('restart', '🔄');
  int _playerScore = 0;
  int _computerScore = 0;

  // Fucntion to when he click a choice
  void playGame(Move playerChoice) {
    final computerChoice = getRandomMove();
    final outcome = getOutcome(playerChoice, computerChoice);

    // Update scores based on outcome
    if (outcome == Outcome.win.message) {
      _playerScore++;
    } else if (outcome == Outcome.lose.message) {
      _computerScore++;
    }

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
      _computerScore = 0;
      _playerScore = 0;
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
                  '$_playerName: ${_playerMove?.symbol ?? question.code}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  '$_computerName: ${_computerMove?.symbol ?? question.code}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 50),
                Text(
                  _resultMessage,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
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
                      child: Image.asset(
                        'images/rock.png',
                        width: 70,
                        height: 70,
                      ),
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
                      child: Image.asset(
                        'images/paper.png',
                        width: 70,
                        height: 70,
                      ),
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
                      child: Image.asset(
                        'images/scissors.png',
                        width: 70,
                        height: 70,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                // Display Scores below the buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Your score: $_playerScore',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 30),
                    Text(
                      'Computer score: $_computerScore',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: _resetGame,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0x00000000),
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  ),
                  child: Text(restart.code, style: TextStyle(fontSize: 30)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
