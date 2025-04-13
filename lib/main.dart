import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'RPS Game', home: RPSGame());
  }
}

class RPSGame extends StatelessWidget {
  const RPSGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rock Paper Scissors')),
      body: const Center(child: Text("Game will go here")),
    );
  }
}
